import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:lbloc/presentation/screens/01_simple_cubit/simple_cubit.dart';
import 'package:lbloc/presentation/screens/02_cubit_router/cubit_router.dart';
import 'package:lbloc/presentation/screens/03_multiple_cubits/multiple_cubits.dart';
import 'package:lbloc/presentation/screens/05_pokemon/pokemon_cubit.dart';
import 'package:lbloc/presentation/screens/07_counter_bloc/counter_bloc.dart';
import 'package:lbloc/presentation/screens/08_todo_bloc/todos_screen.dart';
import 'package:lbloc/presentation/screens/09_weather_app/weather_app.dart';
import 'package:lbloc/presentation/screens/home/home.dart';

final _appRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(path: '/cubit', builder: (context, state) => const SimpleCubit()),
  GoRoute(path: '/router', builder: (context, state) => const RouterScreen()),
  GoRoute(path: '/multi', builder: (context, state) => const MultipleCubits()),
  GoRoute(path: '/poke', builder: (context, state) => const PokemonCubit()),
  GoRoute(
      path: '/counter', builder: (context, state) => const CounterWithBloc()),
  GoRoute(path: '/todo', builder: (context, state) => const TodoScreen()),
  GoRoute(path: '/weather', builder: (context, state) => const WeatherScreen()),
  GoRoute(
    path: '/green',
    builder: (context, state) => Container(color: Colors.green),
  ),
]);

class RouterSimpleCubit extends Cubit<GoRouter> {
  RouterSimpleCubit() : super(_appRouter);

  void goBack() {
    state.pop();
  }

  void goHome() {
    state.go('/');
  }
}
