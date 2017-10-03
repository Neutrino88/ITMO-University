#pragma once

#include <string>
#include <map>
#include <regex>
#include <list>
#include <iostream>
#include <vector>

#define MAX(a,b) ( ((a) > (b)) ? (a) : (b) )

#define MAX_CONST_LENGTH 10
#define MAX_IDENT_LENGTH 20
#define MAX_RESWORD_LENGTH 10
#define MAX_OPER_PR0_LENGTH 2
#define MAX_OPER_PR1_LENGTH 1
#define MAX_OPER_PR2_LENGTH 1

using VectorStr = std::vector<std::string>;

struct Token {
	std::string lexem;
	int lexemClass;
	int id;
	int lineNumber;

	Token(std::string lexem, int lexemClass, int id, int lineNumber) 
		: lexem(lexem), lexemClass(lexemClass), id(id), lineNumber(lineNumber)
	{};
};

enum LexemClass {
	LC_CONST,		// 0
	LC_IDENT,		// 1
	LC_OPER_PR0,	// 2
	LC_OPER_PR1,	// 3	
	LC_OPER_PR2,	// 4	
	LC_OPER_OTHER,	// 5
	LC_RESEVEDWORD,	// 6
	LC_NOT_USE		// 7
};

class LexicalAnalizer{
	std::vector <Token> tokens;	
	int numId = 0;
	int lineNum = 1;

	const VectorStr operPriority0	{ ">>", "<<", "-", "*", "/"};
	const VectorStr operPriority1	{ "+", "-" };
	const VectorStr operPriority2	{ ">", "<", "=" };
	const VectorStr operOther		{ ":=", "/*", "*/", "(", ")" };
	const VectorStr reservedWords	{ "BEGIN", "ELSE", "VAR", "END", "IF" };

	const std::string commentOn = "/*";
	const std::string commentOff = "*/";

	std::string getCharsFromFile(FILE * const & file, int count);

	// Set operators type in TOKENS
	void setOperatorsTypes(void);

	std::string getConst(FILE* const & file);
	std::string getIdent(FILE* const & file);
	std::string getReservedWord(FILE* const & file);
	std::string getOperator(FILE* const & file);

public:
	// Read file and split operators in TOKENS
	bool readFile(char const * const filename);
	
	// Return TOKENS
	std::vector <Token> getTokens();
};
