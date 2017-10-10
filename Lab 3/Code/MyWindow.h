#pragma once
#include <windows.h>

class MyWindow {
	HINSTANCE hInstance;
	WNDCLASS wndClass;
	int nCmdShow;
	HWND hWnd;

public:
	MyWindow(const HINSTANCE hInstance, const int nCmdShow);

	void show(void) const;
	HWND getHWnd(void) const;
	int create(LRESULT(*WndProc)(HWND, UINT, UINT, LONG));
};
