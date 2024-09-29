
// test/user_model_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:your_project_name/models/user_model.dart';

void main() {
	group('User Model', () {
		test('User model should be instantiated with email and password', () {
			final user = User(email: 'test@example.com', password: 'password123');
			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});
		
		test('User model should support serialization to JSON', () {
			final user = User(email: 'test@example.com', password: 'password123');
			final json = user.toJson();
			expect(json, {
				'email': 'test@example.com',
				'password': 'password123',
			});
		});
		
		test('User model should support deserialization from JSON', () {
			final json = {
				'email': 'test@example.com',
				'password': 'password123',
			};
			final user = User.fromJson(json);
			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});
	});
}
