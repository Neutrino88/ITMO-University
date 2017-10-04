#include <reg51.h>

main() { 
	char code str[18] = "This programmator!";
	char data nstr[36];
	unsigned char data i, j = 0; 
	
	for (i = 0; i < 18; ++i){ 
		nstr[j++] = str[i];
		
		if (str[i] == 'r'){
			nstr[j++] = ' ';
		}
	} 
}
