
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_cubit_app/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_app/cubits/auth_cubit.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('displays email and password input fields and a login button', (WidgetTester tester) async {
			final mockAuthCubit = MockAuthCubit();

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>.value(
						value: mockAuthCubit,
						child: LoginScreen(),
					),
				),
			);

			expect(find.byType(TextField), findsNWidgets(2)); // email and password fields
			expect(find.text('Login'), findsOneWidget); // login button
		});
	});

	group('LoginScreen Cubit Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
			when(() => mockAuthCubit.state).thenReturn(Unauthenticated());
		});

		blocTest<MockAuthCubit, AuthState>(
			'emits [Authenticated] when login is successful',
			build: () => mockAuthCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [isA<Authenticated>()],
		);

		blocTest<MockAuthCubit, AuthState>(
			'remains [Unauthenticated] when login fails',
			build: () => mockAuthCubit,
			act: (cubit) => cubit.login('test@example.com', 'wrongpassword'),
			expect: () => [isA<Unauthenticated>()],
		);
	});
}
