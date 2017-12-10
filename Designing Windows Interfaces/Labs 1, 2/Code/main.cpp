#include <windows.h>
#include "resource.h"
#include "MyWindow.h"
#include <string>
#include <ctime>

LRESULT WndProc(HWND, UINT, WPARAM, LPARAM);
int ApplyFilter(HWND, HBITMAP);
int ApplyPixelByPixelFilter(HWND, HBITMAP);
int RotateBitmap(HWND, HBITMAP);
int SaveBitmap(HDC, HBITMAP, int, int);
void TimeApplyFilterTest(HWND);
HBITMAP GetHBitmap(HBITMAP);

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE, LPWSTR lpCmdLine, int nCmdShow){
	// Create window
	myWindow mainWin(hInstance, nCmdShow);
	mainWin.create(WndProc);
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
		case WM_COMMAND: {
			if (LOWORD(wParam) == IDM_APPLY_BITBLT) {
				HANDLE hBitmap = GetHBitmap(NULL);		/* Get BITMAP */

				if (hBitmap != NULL) {
					ApplyFilter(hWnd, (HBITMAP)hBitmap);
				}			
			}
			if (LOWORD(wParam) == IDM_APPLY_SETPIXEL) {
				HANDLE hBitmap = GetHBitmap(NULL);		/* Get BITMAP */

				if (hBitmap != NULL) {
					ApplyPixelByPixelFilter(hWnd, (HBITMAP)hBitmap);
				}			
			}
			if (LOWORD(wParam) == IDM_ROTATE) {
				HANDLE hBitmap = GetHBitmap(NULL);		/* Get BITMAP */

				if (hBitmap != NULL) {
					RotateBitmap(hWnd, (HBITMAP)hBitmap);
				}			
			}
			if (LOWORD(wParam) == IDM_SAVE_PICTURE) {
				hCompatibleDC = CreateCompatibleDC(NULL);
				hBitmap = GetHBitmap(NULL);

				if (hBitmap == NULL) {
					break;
				}

				GetObject(hBitmap, sizeof(bitmap), &bitmap);
				SaveBitmap(hCompatibleDC, (HBITMAP)hBitmap, bitmap.bmWidth, bitmap.bmHeight);
			}
			if (LOWORD(wParam) == IDM_RUN_TEST) {
				TimeApplyFilterTest(hWnd);
			}
			if (LOWORD(wParam) == IDM_REOPEN_PICTURE) {
				hBitmap = (HBITMAP)LoadImage(NULL, L"picture.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);

				if (hBitmap != nullptr) {
					GetHBitmap((HBITMAP)hBitmap);
					InvalidateRect(hWnd, NULL, TRUE);
				}
			}
			break;
		}
		case WM_PAINT: {
			PAINTSTRUCT ps;
			HDC hDC = BeginPaint(hWnd, &ps);

			hBitmap = GetHBitmap(NULL);		/* Get BITMAP */

			if (hBitmap == NULL) {
				break;
			}

			hCompatibleDC = CreateCompatibleDC(hDC);	/* Create Device_Context compatible with current window */
			SelectObject(hCompatibleDC, hBitmap);		/* Select hBitmap in hCompatibleDC context */

			GetObject(hBitmap, sizeof(bitmap), &bitmap);										/* Get BITMAP size */
			BitBlt(hDC, 0, 0, bitmap.bmWidth, bitmap.bmHeight, hCompatibleDC, 0, 0, SRCCOPY);

			DeleteDC(hCompatibleDC);	/* Delete compatible contex */
			EndPaint(hWnd, &ps);		/* Free main context and finish redraw of window work area */
			break;
		}
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

HBITMAP GetHBitmap(HBITMAP newHBitmap) {
	static HBITMAP hBitmap;

	if (newHBitmap != NULL) {
		hBitmap = newHBitmap;
	}

	if (hBitmap == NULL) {
		hBitmap = (HBITMAP)LoadImage(NULL, L"picture.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
	}

	return hBitmap;
}

int ApplyFilter(HWND hWnd, HBITMAP hBitmap) {
	BITMAP bitmap;
	HDC hCompatibleDC = CreateCompatibleDC(NULL);	/* Create Device_Context compatible with current window */
	SelectObject(hCompatibleDC, hBitmap);			/* Select hBitmap in hCompatibleDC context */

	GetObject(hBitmap, sizeof(bitmap), &bitmap);	/* Get BITMAP size */

	SelectObject(hCompatibleDC, GetStockObject(DC_BRUSH));	/* Select DC_BRUSH in hCompatibleDC context */
	SetDCBrushColor(hCompatibleDC, RGB(255, 255, 0));		/* Set in current brush context color(255,255,0) */

	if (!BitBlt(hCompatibleDC, 0, 0, bitmap.bmWidth, bitmap.bmHeight, hCompatibleDC, 0, 0, MERGECOPY)) {
		return 1;
	}

	InvalidateRect(hWnd, NULL, TRUE);			/* Set rectangle for redraw window */
	DeleteDC(hCompatibleDC);					/* Delete compatible contex */

	return 0;
}
int ApplyPixelByPixelFilter(HWND hwnd, HBITMAP hBitmap) {
	BITMAP bitmap;
	GetObject(hBitmap, sizeof(bitmap), &bitmap);

	HDC hCompatibleDC = CreateCompatibleDC(NULL);
	SelectObject(hCompatibleDC, hBitmap);

	for (int i = 0; i < bitmap.bmWidth; i++) {
		for (int j = 0; j < bitmap.bmHeight; j++) {
			SetPixel(hCompatibleDC, i, j, GetPixel(hCompatibleDC, i, j) & 0x00FFFF);
		}
	}

	InvalidateRect(hwnd, NULL, TRUE);
	DeleteDC(hCompatibleDC);

	return 0;
}
int RotateBitmap(HWND hWnd, HBITMAP hBitmap) {
	BITMAP bitmap;
	GetObject(hBitmap, sizeof(BITMAP), &bitmap);

	HDC hCompatibleDC = CreateCompatibleDC(NULL);
	SelectObject(hCompatibleDC, hBitmap);

	BITMAPINFO bitmapInfo = { 0 };

	bitmapInfo.bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
	bitmapInfo.bmiHeader.biWidth = bitmap.bmHeight;
	bitmapInfo.bmiHeader.biHeight = bitmap.bmWidth;
	bitmapInfo.bmiHeader.biPlanes = bitmap.bmPlanes;
	bitmapInfo.bmiHeader.biBitCount = bitmap.bmBitsPixel;
	bitmapInfo.bmiHeader.biCompression = BI_RGB;
	bitmapInfo.bmiHeader.biSizeImage = bitmap.bmWidth * bitmap.bmHeight * 4;
	bitmapInfo.bmiHeader.biClrImportant = 0;

	/* Alloc memory */
	LPBYTE lpBits = (LPBYTE)GlobalAlloc(GMEM_FIXED, bitmapInfo.bmiHeader.biSizeImage);
	LPBYTE buffBits = (LPBYTE)GlobalAlloc(GMEM_FIXED, bitmapInfo.bmiHeader.biSizeImage);

	if (lpBits == 0 || buffBits == 0) {
		return 1;
	}

	/* Copy bits map in lpBits */
	GetDIBits(hCompatibleDC, hBitmap, 0, bitmap.bmHeight, lpBits, &bitmapInfo, DIB_RGB_COLORS);

	/* Work with pixels array */
	LONG ind, w, h;
	LONG nind, nw, nh;

	// (i % 4 == 0) BLUE
	// (i % 4 == 1) GREEN
	// (i % 4 == 2) RED

	for (LONG i = 0; i < (LONG)(bitmapInfo.bmiHeader.biSizeImage >> 2); ++i) {
		w = i % bitmap.bmHeight;
		h = i / bitmap.bmHeight;
		ind = i << 2;

		nw = h;
		nh = abs(bitmapInfo.bmiHeader.biHeight - w - 1);
		nind = (nh * bitmapInfo.bmiHeader.biHeight + nw) << 2;

		buffBits[nind]	   = lpBits[ind];
		buffBits[nind + 1] = lpBits[ind + 1];
		buffBits[nind + 2] = lpBits[ind + 2];
	}

	/* Set pixels in compatible in hBitmap */
	SetDIBits(hCompatibleDC, hBitmap, 0, bitmapInfo.bmiHeader.biHeight, buffBits, &bitmapInfo, DIB_RGB_COLORS);

	GlobalFree((HGLOBAL)lpBits);
	GlobalFree((HGLOBAL)buffBits);
	
	InvalidateRect(hWnd, NULL, TRUE);
	DeleteDC(hCompatibleDC);

	return 0;
}

int SaveBitmap(HDC hdc, HBITMAP hBitmap, int width, int height) {
	BITMAPFILEHEADER bmpHeader;
	BITMAPINFOHEADER infoHeader;

	infoHeader.biSize = sizeof(BITMAPINFOHEADER);
	infoHeader.biWidth = width;
	infoHeader.biHeight = height;
	infoHeader.biPlanes = 1;
	infoHeader.biBitCount = 24;
	infoHeader.biCompression = BI_RGB;
	infoHeader.biSizeImage = 0;
	infoHeader.biXPelsPerMeter = 0;
	infoHeader.biYPelsPerMeter = 0;
	infoHeader.biClrUsed = 0;
	infoHeader.biClrImportant = 0;

	DWORD dwBmpSize = ((width * infoHeader.biBitCount + 23) / 24) * 3 * height;

	HANDLE hDIB = GlobalAlloc(GHND, dwBmpSize); /* Allocate dwBmpSize byte memory */
	char *lpbitmap = (char*)GlobalLock(hDIB);

	GetDIBits(hdc, hBitmap, 0, (UINT)height,
		lpbitmap, (BITMAPINFO *)&infoHeader, DIB_RGB_COLORS);				/* Copy bits map in lpbitmap */

	HANDLE hFile = CreateFile(L"result.bmp", GENERIC_WRITE, 0, NULL,
		CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);						/* Create file */

	if (hFile == INVALID_HANDLE_VALUE) {
		return 1;
	}

	DWORD dwSizeofDIB = dwBmpSize + sizeof(BITMAPFILEHEADER) + sizeof(BITMAPINFOHEADER);

	bmpHeader.bfOffBits = (DWORD)sizeof(BITMAPFILEHEADER) + (DWORD)sizeof(BITMAPINFOHEADER);
	bmpHeader.bfSize = dwSizeofDIB;
	bmpHeader.bfType = 0x4D42;

	/* Writing to file */
	DWORD dwBytesWritten = 0;

	WriteFile(hFile, (LPSTR)&bmpHeader, sizeof(BITMAPFILEHEADER), &dwBytesWritten, NULL);
	if (dwBytesWritten != sizeof(BITMAPFILEHEADER)) {
		//MessageBox(NULL, "Can't write to file!", "Error", MB_OK);
		return 2;
	}

	WriteFile(hFile, (LPSTR)&infoHeader, sizeof(BITMAPINFOHEADER), &dwBytesWritten, NULL);
	if (dwBytesWritten != sizeof(BITMAPINFOHEADER)) {
		//MessageBox(NULL, "Can't write to file!", "Error", MB_OK);
		return 3;
	}

	WriteFile(hFile, (LPSTR)lpbitmap, dwBmpSize, &dwBytesWritten, NULL);
	if (dwBytesWritten != dwBmpSize) {
		//MessageBox(NULL, "Can't write to file!", "Error", MB_OK);
		return 4;
	}

	/* Unlock and free the DIB from the heap */
	GlobalUnlock(hDIB);
	GlobalFree(hDIB);
	/* Close the handle for the file that was created */
	CloseHandle(hFile);

	return 0;
}

void TimeApplyFilterTest(HWND hWnd) {
	HBITMAP hBitmap, hBaseBitmap;
	clock_t startTime;

	hBaseBitmap = GetHBitmap(NULL);

	if (hBaseBitmap == NULL) {
		return;
	}

	std::wstring result = L"\t";

	for (int size = 1; size <= 10; ++size) {
		result += std::to_wstring(size * 200) + L"\t";
	}

	for (int filterType = 0; filterType <= 1; filterType++) {
		result += (filterType == 0 ? L"\nBitBlt:\t" : L"GetSet:\t");

		for (int size = 1; size <= 10; ++size) {
			hBitmap = (HBITMAP)CopyImage(hBaseBitmap, IMAGE_BITMAP, size * 200, size * 200, 0);

			startTime = clock();
			if (filterType == 0) {
				ApplyFilter(hWnd, hBitmap);
			}
			else {
				ApplyPixelByPixelFilter(hWnd, hBitmap);
			}

			result += std::to_wstring((int)clock() - (int)startTime) + L"\t";

			DeleteObject(hBitmap);
		}
		result += L"\n";
	}

	MessageBoxW(hWnd, result.c_str(), L"Результаты теста", MB_OK);
}