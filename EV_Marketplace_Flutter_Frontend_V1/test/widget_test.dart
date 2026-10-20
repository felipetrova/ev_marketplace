import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ev_marketplace/main.dart';

void main() {
  testWidgets('shows login screen when logged out', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const EVMarketplaceApp());
    await tester.pump();
    expect(find.text('EV Marketplace'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
  });
}
