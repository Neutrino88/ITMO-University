#!/bin/ksh

IFS=
ERRFILE="$HOME/lab1_err"
ERROR="Ошибка! Смотри $ERRFILE"

function print_menu {
	echo "Выберите нужный пункт меню:
	1. Напечатать имя текущего каталога
	2. Сменить текущий каталог
	3. Выполнить введенную команду
	4. Создать каталог
	5. Удалить каталог вместе с его содержимым
	6. Выйти из программы"
}

function print_current_directory {
	echo "`pwd`" 2>>${ERRFILE} || print -u2 $ERROR
}

function change_current_directory {
	echo "Введите название каталога:"
	read -r catalog || exit 0
	cd "$PWD" "$catalog" 2>>${ERRFILE} || print -u2 $ERROR
}

function run_cmd {
	echo "Введите название команды:"
	IFS=" "
	read -r cmd args || exit 0
	${cmd} `echo ${args} | awk -F':' '{ for(k=0; k<NF; ++k) {print $k}}' ` 2>>${ERRFILE} || print -u2 $ERROR
	IFS=
}

function create_directory {
	echo "Введите название каталога:"
	read -r catalog || exit 0
	mkdir -- "$catalog" 2>>${ERRFILE} || print -u2 $ERROR
}

function delete_directory {
	echo "Введите название каталога:"
	read -r catalog || exit 0

	echo "Удалить каталог '$catalog' со всем содержимым? (yes/no)"
	read -r cond 2>>${ERRFILE} || exit 0
		
	if [[ "$cond" = "yes" ]]
	then
		rm -rf -- "$catalog" 2>>${ERRFILE} || print -u2 $ERROR
	fi
}

while true
do
	print_menu && read -r menuItem || exit 0

	case $menuItem in
		1)
		print_current_directory;;	
		2)
		change_current_directory;;	
		3)
		run_cmd;;
		4)
		create_directory;;
		5)
		delete_directory;;
		6)
		exit 0;;	
		*)
		echo "Нет такого пункта меню"
	esac
done
