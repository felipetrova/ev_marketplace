import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/network/api_client.dart';
import '../models/vehicle.dart';

class AppState extends ChangeNotifier {
  final ApiClient api = ApiClient();
  bool isLoggedIn = false;
  bool backendOnline = false;
  bool courtesyUsed = false;
  String userName = 'Usuário EV';
  Vehicle? vehicle;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool('loggedIn') ?? false;
    courtesyUsed = prefs.getBool('courtesyUsed') ?? false;
    userName = prefs.getString('userName') ?? 'Usuário EV';
    notifyListeners();
    await checkBackend();
  }

  Future<void> checkBackend() async {
    try {
      await api.get('/health');
      backendOnline = true;
    } catch (_) {
      backendOnline = false;
    }
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn = true;
    userName = email.split('@').first;
    await prefs.setBool('loggedIn', true);
    await prefs.setString('userName', userName);
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', false);
    isLoggedIn = false;
    notifyListeners();
  }

  Future<void> markCourtesyUsed() async {
    final prefs = await SharedPreferences.getInstance();
    courtesyUsed = true;
    await prefs.setBool('courtesyUsed', true);
    notifyListeners();
  }

  void saveVehicle(Vehicle value) {
    vehicle = value;
    notifyListeners();
  }
}
