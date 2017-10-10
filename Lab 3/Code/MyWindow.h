#pragma once
#include <windows.h>

class MyWindow {
	HINSTANCE hInstance;
	WNDCLASS wndClass;
	int nCmdShow;
	HWND hWnd;

public:
	MyWindow(HINSTANCE HInstance, int NCmdShow)
	{
		hInstance = HInstance;
		nCmdShow = NCmdShow;
	}

	HWND getHWnd() {
		return hWnd;
	}

	int create(LRESULT (*WndProc)(HWND, UINT, UINT, LONG)) {
		/* Set WINDOW attributes */
		wndClass.style = CS_HREDRAW | CS_VREDRAW;
		wndClass.lpfnWndProc = (WNDPROC)WndProc;
		wndClass.cbClsExtra = 0;
		wndClass.cbWndExtra = 0;
		wndClass.hInstance = hInstance;
		wndClass.hIcon = LoadIcon(NULL, IDI_APPLICATION);
		wndClass.lpszMenuName = NULL;
		wndClass.hCursor = LoadCursor(NULL, IDC_ARROW);
		wndClass.lpszClassName = L"window";

		/* Register WINDOWS class */
		if (!RegisterClass(&wndClass)) {
			return 1;
		}

		/* Create WINDOW */
		hWnd = CreateWindow(wndClass.lpszClassName,
			L"Lab 3", WS_POPUPWINDOW | WS_CLIPCHILDREN | WS_CAPTION,
			600, 200, 180, 290, NULL, NULL, hInstance, NULL);

		if (!hWnd) {
			return 2;
		}

		return 0;
	}

	void show() {
		ShowWindow(hWnd, nCmdShow);
		UpdateWindow(hWnd);
	}
};
