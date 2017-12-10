#pragma once
#include <windows.h>

#define MYEDIT_AUTOHSCROLL			ES_AUTOHSCROLL
#define MYEDIT_AUTOVSCROLL			ES_AUTOVSCROLL
#define MYEDIT_CENTER				ES_CENTER
#define MYEDIT_LEFT					ES_LEFT
#define MYEDIT_LOWERCASE			ES_LOWERCASE
#define MYEDIT_MULTILINE			ES_MULTILINE
#define MYEDIT_NUMBER				ES_NUMBER
#define MYEDIT_PASSWORD				ES_PASSWORD
#define MYEDIT_READONLY				ES_READONLY
#define MYEDIT_RIGHT				ES_RIGHT
#define MYEDIT_UPPERCASE			ES_UPPERCASE
#define MYEDIT_WANTRETURN			ES_WANTRETURN

#define MYEDIT_BASE_TEXT L"AbCdE\n2\n3\n4\n5\n6\nLast"

class MyEdit
{
	HINSTANCE hInstance;
	HWND hWnd;
	HWND hParent;
	
public:
	MyEdit(const HINSTANCE hInstance, const HWND hParent, const DWORD flags,
		size_t left = 10, size_t top = 10, size_t width = 140, size_t height = 70);

	HWND getParentHWnd(void);
	HWND getHWnd(void);  
};

