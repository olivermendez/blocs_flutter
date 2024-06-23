import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lbloc/config/config.dart';
import 'package:lbloc/presentation/blocs/01_simple_cubit/username_cubit.dart';

class SimpleCubit extends StatelessWidget {
  const SimpleCubit({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('rendered');
    //final username = context.watch<UsernameCubit>();
    final username = context.read<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Cubit')),
      body: Center(child: BlocBuilder<UsernameCubit, String>(
        builder: (context, state) {
          debugPrint('changed');
          return Text(state);
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => username.setUsername(RandomGenerator.getRandomName()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
