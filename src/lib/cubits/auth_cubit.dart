
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';
import 'package:my_app/models/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) {
		// Simulating a login process
		final user = User(email: email, password: password);
		emit(Authenticated(user));
	}

	void logout() {
		emit(Unauthenticated());
	}
}
