
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubit.dart';

class AuthFormWidget extends StatelessWidget {
	const AuthFormWidget({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final _formKey = GlobalKey<FormState>();
		final TextEditingController _emailController = TextEditingController();
		final TextEditingController _passwordController = TextEditingController();

		return Form(
			key: _formKey,
			child: Column(
				children: [
					TextFormField(
						key: Key('emailField'),
						controller: _emailController,
						decoration: InputDecoration(labelText: 'Email'),
						validator: (value) {
							if (value == null || value.isEmpty) {
								return 'Please enter your email';
							} else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
								return 'Please enter a valid email';
							}
							return null;
						},
					),
					TextFormField(
						key: Key('passwordField'),
						controller: _passwordController,
						decoration: InputDecoration(labelText: 'Password'),
						obscureText: true,
						validator: (value) {
							if (value == null || value.isEmpty) {
								return 'Password cannot be empty';
							}
							return null;
						},
					),
					SizedBox(height: 20),
					ElevatedButton(
						onPressed: () {
							if (_formKey.currentState?.validate() ?? false) {
								context.read<AuthCubit>().login(
									_emailController.text,
									_passwordController.text,
								);
							}
						},
						child: Text('Login'),
					),
				],
			),
		);
	}
}
