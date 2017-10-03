#include <iostream>
#include "LexicalAnalizer.h"

int main(){
	LexicalAnalizer an;

	an.readFile("program.txt");
	
	std::vector <Token> tokens = an.getTokens();

	std::cout << "\n";
	for (int i = 0; i < tokens.size(); ++i) {
		std::cout << tokens[i].lexem << "\t\t" << tokens[i].lexemClass << "\t\t" << tokens[i].id << "\t\t" << tokens[i].lineNumber << '\n';
	}

	system("pause");
    return 0;
}

