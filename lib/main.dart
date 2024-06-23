import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lbloc/config/config.dart';
import 'package:lbloc/presentation/blocs/04_pokeapi/pokeapi_cubit.dart';

import 'package:lbloc/presentation/blocs/blocs.dart';
import 'package:lbloc/presentation/screens/08_todo_bloc/bloc/todo_bloc.dart';
import 'package:lbloc/presentation/screens/09_weather_app/bloc/weather_bloc.dart';
import 'package:lbloc/presentation/screens/09_weather_app/repository/weather_repository.dart';

import 'presentation/screens/07_counter_bloc/bloc/counter_bloc.dart';

void main() {
  runApp(const BlocsProviers());
}

class BlocsProviers extends StatelessWidget {
  const BlocsProviers({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsernameCubit()),
        BlocProvider(create: (context) => RouterSimpleCubit()),
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => PokeapiCubit()),
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => TodoBloc()),
        BlocProvider(create: (context) => WeatherBloc(WeatherRepository())),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.watch<RouterSimpleCubit>().state;
    final theme = context.watch<ThemeCubit>().state;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig: appRouter,
      theme: AppTheme(isDarkMode: theme.isDarkmode).getTheme(),
    );
  }
}
