import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class CounterWithBloc extends StatelessWidget {
  const CounterWithBloc({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text('Counter with bloc')),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(Increment());
                    //counterBloc.add(Increment());
                  },
                  icon: const Icon(Icons.add, size: 50),
                ),
                Text('${state.counter}', style: const TextStyle(fontSize: 100)),
                IconButton(
                  onPressed: () {
                    counterBloc.add(Decrement());
                  },
                  icon: const Icon(Icons.remove, size: 50),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
