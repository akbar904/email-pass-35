
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cubit_app/main.dart';

void main() {
	group('MyApp', () {
		testWidgets('renders MyApp', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			expect(find.byType(MyApp), findsOneWidget);
		});

		testWidgets('initial route is LoginScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			await tester.pumpAndSettle();
			expect(find.text('Login'), findsOneWidget);
		});
	});
}
