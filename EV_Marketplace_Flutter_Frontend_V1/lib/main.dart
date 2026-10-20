import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'services/app_state.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const EVMarketplaceApp());
}

class EVMarketplaceApp extends StatelessWidget {
  const EVMarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState()..load(),
      child: MaterialApp(
        title: 'EV Marketplace',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: Consumer<AppState>(
          builder: (_, state, __) => state.isLoggedIn
              ? const HomeScreen()
              : const LoginScreen(),
        ),
      ),
    );
  }
}
