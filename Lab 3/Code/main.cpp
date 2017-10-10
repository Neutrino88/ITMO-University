#include <windows.h>

#include "MyWindow.h"
#include "MyEdit.h"

LRESULT WndProc(HWND, UINT, WPARAM, LPARAM);

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE, LPWSTR lpCmdLine, int nCmdShow){
	// Create window
	MyWindow mainWin(hInstance, nCmdShow);
	mainWin.create(WndProc);

	size_t x=10, y=0;

	MyEdit edit1(hInstance, mainWin.getHWnd(), MYEDIT_WANTRETURN | MYEDIT_MULTILINE | MYEDIT_CENTER, x, y += 40, 140, 40);
	MyEdit edit2(hInstance, mainWin.getHWnd(), MYEDIT_AUTOHSCROLL | MYEDIT_AUTOVSCROLL | MYEDIT_MULTILINE | MYEDIT_UPPERCASE, x, y += 40, 140, 40);
	MyEdit edit4(hInstance, mainWin.getHWnd(), MYEDIT_LOWERCASE, x, y += 40, 140, 40);
	MyEdit edit5(hInstance, mainWin.getHWnd(), MYEDIT_PASSWORD, x, y += 40, 140, 40);
	MyEdit edit6(hInstance, mainWin.getHWnd(), MYEDIT_RIGHT, x, y += 40, 140, 40);

	mainWin.show();

	// Catch messanges
	MSG Msg;
	while (GetMessage(&Msg, NULL, 0, 0)) {
		TranslateMessage(&Msg);
		DispatchMessage(&Msg);
	}

	return Msg.wParam;
}

static LRESULT WndProc(HWND hWnd, UINT Message, UINT wParam, LONG lParam) {
	HANDLE hBitmap;
	BITMAP bitmap;
	HDC hCompatibleDC;

	switch (Message) {
		case WM_DESTROY: {
			PostQuitMessage(0);
			break;
		}
		default: {
			return DefWindowProc(hWnd, Message, wParam, lParam);
		}
	}
	return 0;
}