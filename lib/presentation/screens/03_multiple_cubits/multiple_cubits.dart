import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lbloc/config/config.dart';
import 'package:lbloc/presentation/blocs/blocs.dart';

class MultipleCubits extends StatelessWidget {
  const MultipleCubits({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<CounterCubit>();
    final theme = context.watch<ThemeCubit>();
    final username = context.read<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text("Multiple Cubits")),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1),
            IconButton(
              onPressed: () => theme.toggleTheme(),
              icon: theme.state.isDarkmode
                  ? const Icon(Icons.dark_mode_outlined, size: 50)
                  : const Icon(Icons.light_mode_outlined, size: 50),
            ),
            BlocBuilder<UsernameCubit, String>(
              builder: (context, state) {
                return Text(
                  state,
                  style: const TextStyle(fontSize: 25),
                );
              },
            ),
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            value.incrementBy(10);
                            if (value.state > 50) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Awesome!')),
                              );
                            }
                          },
                          icon: const Icon(Icons.add, size: 50),
                        ),
                        Text('$state', style: const TextStyle(fontSize: 100)),
                        IconButton(
                          onPressed: () => value.decrement(),
                          icon: const Icon(Icons.remove, size: 50),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            const Spacer(flex: 2)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => username.setUsername(RandomGenerator.getRandomName()),
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
