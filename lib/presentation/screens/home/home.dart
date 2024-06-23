import 'package:flutter/material.dart';

import 'package:lbloc/presentation/widgets/custom_listtile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter blocs'),
      ),
      body: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CustomListTile(
          title: 'Simple Cubit',
          subtitle: 'Subtitle',
          location: '/cubit',
        ),
        CustomListTile(
          title: 'Cubit + Go Router',
          subtitle: 'Subtitle',
          location: '/router',
        ),
        CustomListTile(
          title: 'Multiple Cubits',
          subtitle: 'Subtitle',
          location: '/multi',
        ),
        CustomListTile(
          title: 'Cat Api',
          subtitle: 'Subtitle',
          location: '/poke',
        ),
        CustomListTile(
          title: 'Counter With Bloc',
          subtitle: 'Subtitle',
          location: '/counter',
        ),
        CustomListTile(
          title: 'Todo with bloc',
          subtitle: 'Subtitle',
          location: '/todo',
        ),
        CustomListTile(
          title: 'Weather App',
          subtitle: 'Subtitle',
          location: '/weather',
        ),
      ],
    );
  }
}
