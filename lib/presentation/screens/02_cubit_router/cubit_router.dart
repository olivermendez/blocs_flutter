import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lbloc/config/config.dart';

class RouterScreen extends StatelessWidget {
  const RouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routerCubit = context.read<RouterSimpleCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit + Go Router')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => routerCubit.goBack(),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
