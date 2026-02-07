# HƯỚNG DẪN CHẠY TRÊN WINDOWS

## Bước 1: Cài đặt Flutter (nếu chưa có)

1. Download Flutter SDK: https://docs.flutter.dev/get-started/install/windows
2. Giải nén vào thư mục (ví dụ: `C:\src\flutter`)
3. Thêm Flutter vào PATH:
   - Search "Environment Variables" trong Windows
   - Edit PATH variable
   - Thêm `C:\src\flutter\bin`

4. Kiểm tra cài đặt:
```cmd
flutter doctor
```

## Bước 2: Giải nén project

1. Giải nén file `flutter_todo_app.zip`
2. Mở Command Prompt hoặc PowerShell
3. CD vào thư mục project:
```cmd
cd path\to\flutter_todo_app
```

## Bước 3: Cài dependencies

```cmd
flutter pub get
```

## Bước 4: Chạy app

### CÁCH 1: Chạy trên Chrome (KHUYẾN NGHỊ - dễ nhất)

```cmd
flutter config --enable-web
flutter run -d chrome
```

Xong! App sẽ mở trong Chrome browser.

### CÁCH 2: Chạy Windows Desktop App

Yêu cầu: Visual Studio 2022 với C++ desktop development

```cmd
flutter config --enable-windows-desktop
flutter run -d windows
```

### CÁCH 3: Chạy Android Emulator

Yêu cầu: Android Studio + Emulator đã cài

1. Mở Android Studio → AVD Manager → Start emulator
2. Chạy:
```cmd
flutter run
```

## Troubleshooting

### "flutter is not recognized"
- Chưa add Flutter vào PATH. Xem lại Bước 1.3

### "No devices found"
- Với web: Chạy `flutter config --enable-web`
- Với Windows: Cài Visual Studio 2022
- Với Android: Mở emulator trước

### "pub get failed"
- Kiểm tra internet connection
- Chạy: `flutter pub cache repair`

## Demo nhanh trong 30 giây

```cmd
cd flutter_todo_app
flutter pub get
flutter config --enable-web
flutter run -d chrome
```

Done! 🎉

## Các lệnh hữu ích

```cmd
# Xem danh sách devices
flutter devices

# Clean project (nếu lỗi)
flutter clean
flutter pub get

# Check lỗi code
flutter analyze

# Build release (web)
flutter build web

# Build release (Windows)
flutter build windows
```

## Sau khi chạy app

- Press **R** trong terminal để hot reload
- Press **Q** để thoát
- Edit code trong `lib/main.dart` và save → app tự động reload!

## Muốn build IPA?

Bạn cần:
1. Máy Mac hoặc Hackintosh
2. Xcode
3. Apple Developer Account

Hoặc dùng dịch vụ cloud build như:
- Codemagic
- AppCenter
- GitHub Actions với Mac runner
