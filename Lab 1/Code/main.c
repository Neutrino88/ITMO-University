#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>

#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "ipc.h"
#include "pa1.h"
#include "common.h"

int process_count = 3;
int pipes[MAX_PROCESS_ID + 1][MAX_PROCESS_ID + 1][2];

int get_events_log_fd(void){
	static int events_log_fd = -1;

	if (events_log_fd < 0){
		events_log_fd = open(events_log, O_CREAT | O_APPEND | O_WRONLY | O_TRUNC, 0777);
	}

	if (events_log_fd < 0){
		perror("Can not open log file!");
	}

	return events_log_fd;
}

void write_to_log(int log_fd, char* msg, int msg_len){
	printf("[%i]\n", (int)lseek(log_fd, 0, SEEK_END));
	write(log_fd, msg, msg_len);
	write(1, msg, msg_len);
}

void do_nonblock_pipe(int fd){
	int flags = fcntl(fd, F_GETFL);
	fcntl(fd, F_SETFL, flags | O_NONBLOCK);
}

/** Create pipes for echo process to each process including parent process
 *
 * @return 0 on success, any non-zero value on error
 */
int create_pipes(void){
	int pipes_log_fd = open(pipes_log, O_CREAT | O_APPEND | O_WRONLY | O_TRUNC, 0777);

	if (0 > pipes_log_fd){
		perror("Can not open pipes_log!");
		return -1;
	}

	for (int i = 0; i < process_count + 1; ++i){
		for (int j = 0; j < process_count + 1; ++j){
			if (i == j) continue;

			if (pipe(pipes[i][j]) < 0){
				return -1;
			}
			// set O_NONBLOCK flag
			do_nonblock_pipe(pipes[i][j][0]);
			do_nonblock_pipe(pipes[i][j][1]);
			// print to log
			char formated_msg[80];
			int formated_msg_len = sprintf(formated_msg, "Create pipe %i to %i with [%i desc] for READ and [%i desc] for WRITE\n", i, j, pipes[i][j][0], pipes[i][j][1]);
			write(pipes_log_fd, formated_msg, formated_msg_len);
		}
	}

	close(pipes_log_fd);
	return 0;
}

void close_unused_pipes(local_id process_id){
	for (int i = 0; i < process_count + 1; ++i){
		for (int j = 0; j < process_count + 1; ++j){
			if (i != j && i != process_id){
				close(pipes[i][j][1]);
			}
			if (i != j && j != process_id){
				close(pipes[i][j][0]);
			}
		}
	}
}

int child_process(local_id process_id){
	// create STARTED message
	MessageHeader header;
	header.s_magic = MESSAGE_MAGIC;
	header.s_type = STARTED;

	Message message;
	message.s_header = header;
	message.s_header.s_payload_len = sprintf(message.s_payload, log_started_fmt, process_id, getpid(), getppid());
	
	// print STARTED to events log
	write_to_log(get_events_log_fd(), message.s_payload, message.s_header.s_payload_len);

	// send STARTED messages
	if (0 != send_multicast((void*)(size_t)process_id, &message)){
		return -1;
	}

	// receive STARTED messanges
	if (0 == receive_any((void*)(size_t)process_id, &message)){
		message.s_header.s_payload_len = sprintf(message.s_payload, log_received_all_started_fmt, process_id);
		
		// print RECEIVED STARTED to events log
		write_to_log(get_events_log_fd(), message.s_payload, message.s_header.s_payload_len);
	}

	// create DONE message and print to event log
	message.s_header.s_type = DONE;
	message.s_header.s_payload_len = sprintf(message.s_payload, log_done_fmt, process_id);
	write_to_log(get_events_log_fd(), message.s_payload, message.s_header.s_payload_len);

	// send DONE messages
	if (0 != send_multicast((void*)(size_t)process_id, &message)) {
		return -2;
	}
	// receive DONE messanges
	if (0 == receive_any((void*)(size_t)process_id, &message)){
		message.s_header.s_payload_len = sprintf(message.s_payload, log_received_all_done_fmt, process_id);
		
		// print RECEIVED DONE to events log
		write_to_log(get_events_log_fd(), message.s_payload, message.s_header.s_payload_len);
	}

	return 0;
}

/** Create process_count processes and wait them,
 *  set local_id of process
 *
 * @return 0 for parent process,
 * PROCESS_ID for child process,  
 * negative value for error
 */
int create_and_wait_processes(void){
	pid_t process_pids[process_count];

	for (int i = 0; i < process_count; ++i) {
		pid_t pid = fork();

		if (pid < 0){
			perror("Can not create process!");
			return -1;
		}

		if (pid == 0){			
			close_unused_pipes(i+1);
			return i+1;
		}

		process_pids[i] = pid;
	}

	close_unused_pipes(0);
	// waiting finishing borned processes
	for (int i = 0; i < process_count; ++i){
		wait(&process_pids[i]);
	}

	return 0;
}

int main(int argc, char** argv){
	// set process count
	if (3 == argc && 
		0 == strcmp(argv[1], "-p")){

		process_count = atoi(argv[2]);
	}
	// create pipes	
	if (create_pipes() != 0){
		return -1;
	}
	// open events log file
	get_events_log_fd();
	// create child processes
	local_id process_id = create_and_wait_processes();

	if (process_id < 0){
		return -2;
	}
	if (process_id > 0){
		return child_process(process_id);
	}

	close(get_events_log_fd());
	return 0;
}

int send(void * self, local_id dst, const Message * msg){
	local_id process_id = (local_id)self;
	int message_len = msg->s_header.s_payload_len + (dst > 9 ? 1 : 0);

	if (message_len == write(pipes[process_id][dst][1], &(msg->s_payload), message_len)) {
		return 0;
	}

	return -1;
}

int send_multicast(void * self, const Message * msg){
	local_id process_id = (local_id)self;

	for (int id = 0; id < process_count + 1; ++id){
		if (id != process_id && send(self, id, msg) != 0){
			return -1;
		}
	}

	return 0;
}

int receive(void * self, local_id from, Message * msg){
	local_id process_id = (local_id)self;
	int result = 0;
	int message_len = msg->s_header.s_payload_len + (from > 9 ? 1 : 0);

	while (result <= 0){
		result = read(pipes[from][process_id][0], &(msg->s_payload), message_len);
	}

	return 0;
}

int receive_any(void * self, Message * msg_ptr){
	local_id process_id = (local_id)self;

	for (local_id id = 1; id < process_count + 1; ++id){
		if (id != process_id && 0 != receive(self, id, msg_ptr)) {
			return -1;
		}
	}

	return 0;
}
