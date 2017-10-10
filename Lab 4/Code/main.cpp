#include <windows.h>
#include "MyWindow.h"

LRESULT WndProc(HWND, UINT, WPARAM, LPARAM);

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE, LPWSTR lpCmdLine, int nCmdShow){
	// Create window
	MyWindow window(hInstance, nCmdShow);
	window.create(WndProc);

	// Set window form
	POINT p[8];
	p[0].x = 31;	p[0].y = 31;
	p[1].x = 100;	p[1].y = 2;
	p[2].x = 168;	p[2].y = 31;
	p[3].x = 197;	p[3].y = 100;
	p[4].x = 169;	p[4].y = 169;
	p[5].x = 100;	p[5].y = 197;
	p[6].x = 31;	p[6].y = 168;
	p[7].x = 2;		p[7].y = 100;

	HRGN hRgn = CreatePolygonRgn(p, 8, WINDING);
	SetWindowRgn(window.getHWnd(), hRgn, TRUE);
	
	// moving window
	int y = 600;
	int dy = 10;

	while (true) {
		MoveWindow(window.getHWnd(), 400, y, 800, 600, true);
		window.show();

		if (y > -170) y -= dy;
		else y = 600;
		Sleep(100);
	}

	return 0;
}

static LRESULT WndProc(HWND hWnd, UINT Message, UINT wParam, LONG lParam) {
	switch (Message) {
		case WM_DESTROY: {
			PostQuitMessage(0);
		}
		default: {
			return DefWindowProc(hWnd, Message, wParam, lParam);
		}
	}
	return 0;
}