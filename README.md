# Flutter Todo App - iOS Build Guide

Ứng dụng Todo List đơn giản nhưng đầy đủ tính năng để luyện tập build IPA.

## Tính năng

✅ Thêm, sửa, xóa task
✅ Đánh dấu hoàn thành
✅ Phân loại theo mức độ ưu tiên (Low, Medium, High)
✅ Lọc task (All, Active, Completed)
✅ Lưu dữ liệu local với SharedPreferences
✅ Swipe để xóa với undo
✅ UI đẹp, responsive với Material Design 3
✅ Hỗ trợ Dark Mode

## Yêu cầu

### Để build IPA (iOS):
- Flutter SDK (>= 3.0.0)
- Xcode (phiên bản mới nhất)
- macOS
- Apple Developer Account (để build IPA)

### Để test trên Windows:
- Flutter SDK (>= 3.0.0)
- Windows 10/11
- Visual Studio 2022 (cho Windows desktop development)
- Chrome browser (cho web development)

## Cài đặt

### 1. Clone hoặc copy project

```bash
cd flutter_todo_app
```

### 2. Cài đặt dependencies

```bash
flutter pub get
```

### 3. Kiểm tra Flutter doctor

```bash
flutter doctor
```

Đảm bảo iOS toolchain được cài đặt đầy đủ.

## Build IPA

**LƯU Ý:** Build IPA chỉ có thể làm trên macOS. Nếu bạn đang dùng Windows, xem phần "Chạy trên Windows" bên dưới.

### Option 1: Build cho Testing (không cần Developer Account)

```bash
# Chạy trên simulator
flutter run -d "iPhone 15 Pro"

# Hoặc chạy trên thiết bị thật (cần kết nối qua USB)
flutter run -d <device-id>
```

### Option 2: Build IPA cho Distribution (cần Developer Account)

#### Bước 1: Cấu hình Bundle Identifier

Mở `ios/Runner.xcworkspace` trong Xcode:

1. Chọn Runner trong Project Navigator
2. Chọn tab "Signing & Capabilities"
3. Chọn Team của bạn
4. Đổi Bundle Identifier thành unique ID (ví dụ: com.yourname.fluttertodoapp)

#### Bước 2: Build IPA

```bash
# Build release cho iOS
flutter build ios --release

# Sau đó mở Xcode
open ios/Runner.xcworkspace
```

Trong Xcode:
1. Product → Archive
2. Chọn archive vừa tạo
3. Click "Distribute App"
4. Chọn phương thức distribution:
   - **App Store Connect**: Để submit lên App Store
   - **Ad Hoc**: Để cài trên thiết bị test (tối đa 100 devices)
   - **Enterprise**: Nếu có Enterprise account
   - **Development**: Để test trên devices đã register

5. Follow hướng dẫn để export IPA

### Option 3: Build từ Command Line (Advanced)

```bash
# Build archive
flutter build ipa --release

# File IPA sẽ nằm ở:
# build/ios/archive/Runner.xcarchive
```

## Cấu trúc Project

```
flutter_todo_app/
├── lib/
│   └── main.dart          # Code chính của app
├── ios/                   # iOS native files
│   └── Runner/
│       └── Info.plist     # iOS configuration
├── pubspec.yaml           # Dependencies
└── README.md             # File này
```

## Testing

```bash
# Chạy tests
flutter test

# Analyze code
flutter analyze
```

## Troubleshooting

### Lỗi: "No valid code signing certificates were found"

- Đảm bảo bạn đã login Apple Developer Account trong Xcode
- Preferences → Accounts → Add Account

### Lỗi: "Unable to install..."

- Kiểm tra device đã được trust trong Xcode
- Kiểm tra Bundle ID unique

### Build chậm

- Chạy `flutter clean` trước khi build lại
- Đảm bảo máy có đủ RAM và storage

## Tip Build IPA nhanh

Nếu chỉ muốn test trên device của mình mà không submit lên App Store:

1. Kết nối iPhone qua USB
2. Trust device trong Xcode
3. Chạy: `flutter run --release`

IPA file sẽ được cài trực tiếp lên device!

## Chạy trên Windows (để test app)

Windows không thể build IPA, nhưng bạn có thể test app bằng 3 cách:

### 1. Chạy trên Chrome (Web) - NHANH NHẤT

```bash
# Giải nén file zip
# Mở CMD hoặc PowerShell trong thư mục flutter_todo_app

# Cài dependencies
flutter pub get

# Enable web support (chỉ cần chạy 1 lần)
flutter config --enable-web

# Chạy trên Chrome
flutter run -d chrome
```

App sẽ mở trong Chrome browser. Tất cả tính năng đều hoạt động!

### 2. Chạy Windows Desktop App

Nếu bạn đã cài Visual Studio 2022 với C++ desktop development:

```bash
# Enable Windows desktop (chỉ cần chạy 1 lần)
flutter config --enable-windows-desktop

# Build và chạy Windows app
flutter run -d windows
```

App sẽ chạy như một ứng dụng Windows native!

### 3. Chạy trên Android Emulator

Nếu bạn có Android Studio và emulator:

```bash
# Mở Android emulator trước
# Sau đó chạy:
flutter run
```

### Kiểm tra devices khả dụng

```bash
flutter devices
```

Sẽ show list các devices bạn có thể chạy (Chrome, Windows, Android emulator, etc.)

### Hot Reload

Khi app đang chạy, bạn có thể:
- Press `r` để reload
- Press `R` để restart
- Press `q` để quit
- Edit code và save → app tự động update!

## Next Steps

- Thêm backend API với ASP.NET Core
- Tích hợp push notifications
- Thêm sync với cloud
- Thêm widgets iOS
- Thêm Siri shortcuts

## License

MIT License - Free to use and modify
