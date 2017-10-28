#include <windows.h>

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE, LPWSTR lpCmdLine, int nCmdShow){
	// Find window
	HWND hWnd = FindWindow(L"Notepad", NULL);

	// Set window form
	if (hWnd != NULL) {
		HRGN hRgn = CreateEllipticRgn(0, 0, 300, 300);
		SetWindowRgn(hWnd, hRgn, true);
		SetWindowLong(hWnd, GWL_STYLE, WS_VISIBLE);
		UpdateWindow(hWnd); 
	}

	return 0;
}