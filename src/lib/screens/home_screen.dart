
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.flutter_cubit_app/cubits/auth_cubit.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final authCubit = context.read<AuthCubit>();

		return Scaffold(
			appBar: AppBar(
				title: const Text('Home Screen'),
			),
			body: Center(
				child: ElevatedButton(
					onPressed: () {
						authCubit.logout();
					},
					child: const Text('Logout'),
				),
			),
		);
	}
}
