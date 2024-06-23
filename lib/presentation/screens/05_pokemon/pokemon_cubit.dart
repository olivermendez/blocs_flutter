import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/04_pokeapi/pokeapi_cubit.dart';

class PokemonCubit extends StatelessWidget {
  const PokemonCubit({super.key});

  @override
  Widget build(BuildContext context) {
    final cat = context.read<PokeapiCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Cat Cubit')),
      body: BlocBuilder<PokeapiCubit, PokeapiState>(
        builder: (context, state) {
          if (state is PokeapiInitial) {
            return Center(child: Image.network(state.defaulImage));
          } else if (state is PokeapiLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PokeapiLoaded) {
            return Center(child: Image.network(state.image));
          } else if (state is ApiError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            cat.fetchCat();
          },
          child: const Icon(Icons.refresh)),
    );
  }
}
