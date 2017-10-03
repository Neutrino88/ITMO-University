#include "LexicalAnalizer.h"

std::string LexicalAnalizer::getCharsFromFile(FILE * const & file, int count) {
	std::string result;
	char symb;

	while (count-- > 0) {
		symb = getc(file);

		if (symb == EOF) return result;
		result += symb;
	}

	return result;
};

std::string LexicalAnalizer::getConst(FILE* const & file) {
	int num;
	char lexem[MAX_CONST_LENGTH + 1];

	fscanf_s(file, "%i", &num);
	sprintf_s(lexem, MAX_CONST_LENGTH, "%i", num);

	return lexem;
}

std::string LexicalAnalizer::getIdent(FILE* const & file) {
	int lexemI = 0;
	char lexem[MAX_IDENT_LENGTH + 1];

	char symb = getc(file);
	while ('a' <= symb && symb <= 'z' && lexemI < MAX_IDENT_LENGTH) {
		lexem[lexemI++] = symb;
		symb = getc(file);
	}
	lexem[lexemI] = '\0';

	fseek(file, -1, SEEK_CUR);
	return lexem;
}

std::string LexicalAnalizer::getReservedWord(FILE* const & file) {
	std::string lexem;

	// get lexem from file
	char symb = getc(file);
	while ('A' <= symb && symb <= 'Z' && lexem.length() < MAX_RESWORD_LENGTH) {
		lexem += symb;
		symb = getc(file);
	}

	int countChars = 1;  // Count of symbols which need return to file

	// add lexem if it exists
	while (!lexem.empty()) {
		for (size_t i = 0; i < reservedWords.size(); ++i) {
			if (reservedWords[i] == lexem) {
				fseek(file, -countChars-1, SEEK_CUR);
				return lexem;
			}
		}

		lexem.pop_back();
		++countChars;
	}

	fseek(file, -countChars, SEEK_CUR);
	return std::string();
}

std::string LexicalAnalizer::getOperator(FILE* const & file) {
	VectorStr opers = operOther;
	opers.insert(opers.end(), operPriority0.begin(), operPriority0.end());
	opers.insert(opers.end(), operPriority1.begin(), operPriority1.end());
	opers.insert(opers.end(), operPriority2.begin(), operPriority2.end());
	std::sort(opers.begin(), opers.end(), [](const std::string & str1, const std::string & str2) { return str1.length() > str2.length(); });

	// get lexem
	std::string lexem = getCharsFromFile(file, MAX(MAX(MAX_OPER_PR0_LENGTH, MAX_OPER_PR1_LENGTH), MAX_OPER_PR2_LENGTH));
	if (lexem.empty()) { return std::string(); }

	int countChars = 0;  // Count of symbols which need return to file

	// add lexem if it exists
	while (!lexem.empty()) {
		for (size_t i = 0; i < opers.size(); ++i) {
			if (opers[i] == lexem) {
				fseek(file, -countChars, SEEK_CUR);
				return lexem;
			}
		}

		lexem.pop_back();
		++countChars;
	}

	fseek(file, -countChars, SEEK_CUR);
	return std::string();
}

std::vector <Token> LexicalAnalizer::getTokens() {
	return tokens;
}

bool LexicalAnalizer::readFile(char const * const filename) {
	// open file
	FILE* file;
	fopen_s(&file, filename, "r");
	if (nullptr == file) return false;

	// read file
	std::string lexem;
	int lexemClass;
	char symb = ' ';

	while (symb != EOF) {
		lexem.clear();
		lexemClass = -1;

		symb = getc(file);
		// space
		while (symb == '	' || symb == '\t' || symb == '\r' || symb == ' ' || symb == '\n') {
			if (symb == '\n') { ++lineNum; }
			symb = getc(file);
		}
		if (symb == EOF) { break; }

		fseek(file, -1, SEEK_CUR);
		// const
		if ('0' <= symb && symb <= '9') {
			lexem = getConst(file);
			char nlexem[MAX_CONST_LENGTH + 1];

			unsigned int number = std::stoi(lexem);
			sprintf_s(nlexem, "%X", number);

			lexem = nlexem;			
			lexemClass = LC_CONST;
		}
		// identifier
		else if ('a' <= symb && symb <= 'z') {
			lexem = getIdent(file);
			lexemClass = LC_IDENT;
		}
		// reserved word
		else if ('A' <= symb && symb <= 'Z') {
			lexem = getReservedWord(file);
			lexemClass = LC_RESEVEDWORD;
		}
		// operators
		else {
			lexem = getOperator(file);
		}

		if ( lexem.empty() ) {
			fseek(file, 1, SEEK_CUR);
		} else {
			tokens.push_back(Token(lexem, lexemClass, -1, lineNum));
		}
	}

	//
	setOperatorsTypes();

	fclose(file);
	return true;
}

void LexicalAnalizer::setOperatorsTypes(void) {
	int lexemClass;
	std::string lexem;
	bool itIsComment = false;
	bool alreadySet;

	for (size_t i = 0; i < tokens.size(); ++i) {
		alreadySet = false;
		lexemClass = -1;// LC_NOT_USE;
		lexem = tokens[i].lexem;

		// comment
		if (lexem == commentOn) {
			itIsComment = true;
		}
		else if (lexem == commentOff && itIsComment) {
			itIsComment = false;
		}

		if (!alreadySet && (itIsComment || lexem == commentOff) ) {
			tokens[i].lexemClass = LC_NOT_USE;
			continue;
		}

		// set token ID 
		tokens[i].id = numId++;
		// if (lexemClass already exists) then continue
		if (tokens[i].lexemClass != -1) continue;

		// other operator
		if (!alreadySet) {
			for (size_t j = 0; j < operOther.size(); ++j) {
				if (lexem == operOther[j]) {
					lexemClass = LC_OPER_OTHER;
					alreadySet = true;
					break;
				}
			}
		}
		
		// operator with pr 2
		if (!alreadySet) {
			for (size_t j = 0; j < operPriority2.size(); ++j) {
				if (lexem == operPriority2[j]) {
					lexemClass = LC_OPER_PR2;
					alreadySet = true;
					break;
				}
			}
		}

		//// get lexemClass of previos no comment token
		int indPrevToken = i - 1;
		int prevLexemClass = -1;
		while (indPrevToken >= 0 && tokens[indPrevToken].lexemClass == LC_NOT_USE) {
			--indPrevToken;
		}
		if (indPrevToken >= 0) {
			prevLexemClass = tokens[indPrevToken].lexemClass;
		}

		// operator with pr 1
		if (!alreadySet && 
			(prevLexemClass == LC_CONST ||
			 prevLexemClass == LC_IDENT ||
			 tokens[indPrevToken].lexem == ")") ) {

			for (size_t j = 0; j < operPriority1.size(); ++j) {
				if (lexem == operPriority1[j]) {
					lexemClass = LC_OPER_PR1;
					alreadySet = true;
					break;
				}
			}
		}

		// operator with pr 0
		if ( !alreadySet ) {

			for (size_t j = 0; j < operPriority0.size(); ++j) {
				if (lexem == operPriority0[j]) {
					lexemClass = LC_OPER_PR0;
					alreadySet = true;
					break;
				}
			}
		}

		tokens[i].lexemClass = lexemClass;
	}

};
