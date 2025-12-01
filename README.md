# AR FurniView 🛋️

A Flutter mobile application for visualizing furniture in augmented reality (AR). Browse furniture catalogs, view 3D models, and place them in your space using AR technology.

## Features

✨ **Browse Furniture Catalog** - Explore a variety of furniture items including sofas, tables, chairs, and beds
🔍 **Search & Filter** - Find furniture by name or filter by category
❤️ **Favorites** - Save your favorite furniture items for quick access
📱 **3D Model Viewer** - Interactive 3D preview of furniture with rotation and zoom
🎨 **Color Options** - View available colors for each furniture item
📏 **Dimensions Display** - Check exact dimensions before purchasing
🛒 **Shopping Cart** - Add items to cart (UI ready for integration)
🌟 **AR View** - Place furniture in your real space using AR (requires AR-compatible device)

## Tech Stack

- **Flutter** - Cross-platform mobile development framework
- **Provider** - State management solution
- **Model Viewer Plus** - 3D model rendering and AR support
- **Material Design 3** - Modern UI components
- **Google Fonts** - Beautiful typography

## Project Structure

```
lib/
├── models/              # Data models
│   └── furniture_item.dart
├── providers/           # State management
│   └── furniture_provider.dart
├── screens/            # App screens
│   ├── home_screen.dart
│   ├── ar_view_screen.dart
│   └── favorites_screen.dart
├── widgets/            # Reusable widgets
│   ├── furniture_card.dart
│   └── category_chip.dart
└── main.dart           # App entry point

assets/
├── models/             # 3D model files (.glb format)
└── images/             # Product images
```

## Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- AR-compatible device for AR features

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/AR-FurniView.git
   cd AR-FurniView
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Adding 3D Models

1. Place your `.glb` or `.gltf` model files in `assets/models/`
2. Add product images to `assets/images/`
3. Update the furniture data in `lib/providers/furniture_provider.dart`

## Configuration

### Android Setup (for AR)

Add the following to `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-feature android:name="android.hardware.camera.ar" android:required="true" />

<meta-data android:name="com.google.ar.core" android:value="required" />
```

### iOS Setup (for AR)

Add to `ios/Runner/Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>Camera access is required for AR features</string>
<key>io.flutter.embedded_views_preview</key>
<true/>
```

## Features to Implement

- [ ] Backend API integration
- [ ] User authentication
- [ ] Shopping cart functionality
- [ ] Order management
- [ ] Payment integration
- [ ] User reviews and ratings
- [ ] Social sharing
- [ ] Real AR measurement tools
- [ ] Room scanning and furniture placement optimization

## Dependencies

```yaml
dependencies:
  flutter: sdk: flutter
  provider: ^6.1.1              # State management
  model_viewer_plus: ^1.7.2     # 3D models and AR
  google_fonts: ^6.1.0          # Typography
  flutter_svg: ^2.0.9           # SVG support
  http: ^1.1.2                  # API calls
  path_provider: ^2.1.1         # File storage
  permission_handler: ^11.1.0   # Permissions
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For questions or support, please open an issue on GitHub.

---

Made with ❤️ using Flutter

