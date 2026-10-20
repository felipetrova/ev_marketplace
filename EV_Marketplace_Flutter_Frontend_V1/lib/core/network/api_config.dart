import 'package:flutter/foundation.dart';

class ApiConfig {
  // Override for physical devices or remote backends:
  // flutter run --dart-define=API_BASE_URL=http://192.168.0.10:3000/api/v1
  static const String _override = String.fromEnvironment('API_BASE_URL');

  static String get baseUrl {
    if (_override.isNotEmpty) return _override;
    // Android Emulator reaches the host machine through 10.0.2.2.
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:3000/api/v1';
    }
    // iOS Simulator, macOS, Windows, Linux and Web (Chrome).
    return 'http://localhost:3000/api/v1';
  }
}
