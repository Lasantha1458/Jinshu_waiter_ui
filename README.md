Jīnzhú Waiter App (Flutter)

This is a starter Flutter project for the Jīnzhú Restaurant waiter tablet UI.
It includes:
- Table selection
- Categories and menu grid
- Cart and send-to-kitchen flow
- Provider-based state management
- API service to send orders to your laptop server

How to run:
1. Install Flutter SDK on your computer: https://flutter.dev/docs/get-started/install
2. From this folder run:
   flutter pub get
   flutter run -d <device-id>

Before building:
- Edit lib/services/api_service.dart and set `serverUrl` to your laptop IP (e.g. http://192.168.1.100:8000)
- Place your logo at assets/images/logo.jpg (optional)
- Add menu item images under assets/items/ if you want images for menu cards

Build APK:
  flutter build apk --release
  adb install build/app/outputs/flutter-apk/app-release.apk
