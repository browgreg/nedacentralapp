# neda_central

North Eastern Darts Association Inc.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 🎨 Color Usage Rule (Mandatory)

❌ Do not use:
- Color.withOpacity()
- Color.fromRGBO(...)
- Opacity() widget

✅ Always use:
- Color.withAlpha(int)

Reason:
- Predictable rendering
- No floating-point opacity
- Consistent theming across devices
