#include <reg51.h>

main() { 
	char code    *str = "This programmator!\0";
	char data    nstr[36];
	unsigned char j = 0;
	
	while ( *str != 0 ){ 
		nstr[j++] = *str;
		
		if ( (*str) == 'r' ){
			(nstr[j++]) = ' ';
		}
		
		++str;
	}
}
