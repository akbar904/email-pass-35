
import 'package:equatable/equatable.dart';
import '../models/user_model.dart';

abstract class AuthState extends Equatable {
	const AuthState();

	@override
	List<Object?> get props => [];
}

class AuthInitial extends AuthState {
	const AuthInitial();

	@override
	List<Object?> get props => [];
}

class Authenticated extends AuthState {
	final User user;

	const Authenticated(this.user);

	@override
	List<Object?> get props => [user];
}

class Unauthenticated extends AuthState {
	const Unauthenticated();

	@override
	List<Object?> get props => [];
}
