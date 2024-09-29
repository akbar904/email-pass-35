
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:equatable/equatable.dart';
import 'package:your_project/cubits/auth_state.dart'; // Ensure to replace 'your_project' with your actual project name

// Mocking necessary dependencies if any, here we mock UserModel as it's used in AuthState
class MockUser extends Mock implements User {}

void main() {
	group('AuthState', () {
		setUpAll(() {
			// Register equatable for testing equality
			registerFallbackValue(MockUser());
		});

		test('AuthState supports value comparisons', () {
			expect(AuthState(), AuthState());
		});

		group('AuthInitial', () {
			test('AuthInitial supports value comparisons', () {
				expect(AuthInitial(), AuthInitial());
			});
		});

		group('Authenticated', () {
			final user = MockUser();

			test('Authenticated supports value comparisons', () {
				expect(Authenticated(user), Authenticated(user));
			});

			test('props returns correct values', () {
				expect(Authenticated(user).props, [user]);
			});
		});

		group('Unauthenticated', () {
			test('Unauthenticated supports value comparisons', () {
				expect(Unauthenticated(), Unauthenticated());
			});
		});
	});
}
