#pragma once

class myWindow {
	HINSTANCE hInstance;
	WNDCLASS wndClass;
	int nCmdShow;
	HWND hWnd;

public:
	myWindow(HINSTANCE HInstance, int NCmdShow)
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
		wndClass.lpszMenuName = MAKEINTRESOURCEW(IDC_MAIN_MENU);
		wndClass.hCursor = LoadCursor(NULL, IDC_ARROW);
		wndClass.lpszClassName = L"window";

		/* Register WINDOWS class */
		if (!RegisterClass(&wndClass)) {
			return 1;
		}

		/* Create WINDOW */
		hWnd = CreateWindow(wndClass.lpszClassName,
			L"Labs 1-2", WS_OVERLAPPEDWINDOW | WS_VSCROLL | WS_HSCROLL,
			CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, NULL, NULL, hInstance, NULL);

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
