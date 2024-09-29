
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.flutter_cubit_app/widgets/auth_form_widget.dart';

class MockAuthCubit extends MockCubit<void> implements AuthCubit {}

void main() {
	group('AuthFormWidget', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		testWidgets('displays email and password input fields and login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider.value(
							value: authCubit,
							child: AuthFormWidget(),
						),
					),
				),
			);

			expect(find.byType(TextFormField), findsNWidgets(2)); // Email and password fields
			expect(find.text('Email'), findsOneWidget);
			expect(find.text('Password'), findsOneWidget);
			expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
		});

		testWidgets('calls login on AuthCubit when login button is pressed', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider.value(
							value: authCubit,
							child: AuthFormWidget(),
						),
					),
				),
			);

			final emailField = find.byKey(Key('emailField'));
			final passwordField = find.byKey(Key('passwordField'));
			final loginButton = find.widgetWithText(ElevatedButton, 'Login');

			await tester.enterText(emailField, 'test@example.com');
			await tester.enterText(passwordField, 'password');
			await tester.tap(loginButton);

			verify(() => authCubit.login('test@example.com', 'password')).called(1);
		});

		testWidgets('shows error message if email is invalid', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider.value(
							value: authCubit,
							child: AuthFormWidget(),
						),
					),
				),
			);

			final emailField = find.byKey(Key('emailField'));
			final passwordField = find.byKey(Key('passwordField'));
			final loginButton = find.widgetWithText(ElevatedButton, 'Login');

			await tester.enterText(emailField, 'invalid-email');
			await tester.enterText(passwordField, 'password');
			await tester.tap(loginButton);
			await tester.pump();

			expect(find.text('Please enter a valid email'), findsOneWidget);
		});

		testWidgets('shows error message if password is empty', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider.value(
							value: authCubit,
							child: AuthFormWidget(),
						),
					),
				),
			);

			final emailField = find.byKey(Key('emailField'));
			final passwordField = find.byKey(Key('passwordField'));
			final loginButton = find.widgetWithText(ElevatedButton, 'Login');

			await tester.enterText(emailField, 'test@example.com');
			await tester.enterText(passwordField, '');
			await tester.tap(loginButton);
			await tester.pump();

			expect(find.text('Password cannot be empty'), findsOneWidget);
		});
	});
}
