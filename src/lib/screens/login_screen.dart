
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_app/cubits/auth_cubit.dart';
import 'package:flutter_cubit_app/widgets/auth_form_widget.dart';

class LoginScreen extends StatelessWidget {
	const LoginScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						AuthFormWidget(),
						SizedBox(height: 20),
						BlocBuilder<AuthCubit, AuthState>(
							builder: (context, state) {
								if (state is Authenticated) {
									Future.microtask(() {
										Navigator.pushReplacementNamed(context, '/home');
									});
								}

								if (state is Unauthenticated) {
									return Column(
										children: [
											Text(
												'Login failed. Please try again.',
												style: TextStyle(color: Colors.red),
											),
											SizedBox(height: 20),
										],
									);
								}

								return Container();
							},
						),
					],
				),
			),
		);
	}
}
