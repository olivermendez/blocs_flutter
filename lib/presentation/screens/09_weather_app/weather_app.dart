import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lbloc/presentation/screens/09_weather_app/bloc/weather_bloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController cityController = TextEditingController();
    final weatherbloc = context.read<WeatherBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather BLoC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: 'Enter City Name',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final city = cityController.text;
                if (city.isNotEmpty) {
                  weatherbloc.add(FetchWeather(city: city));
                }
              },
              child: const Text('Fetch Weather'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherInitial) {
                  return const Text('Enter a city to get the weather');
                } else if (state is WeatherLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WeatherLoaded) {
                  return Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Image.network(state.weather.current.condition.icon),
                        Text(
                          textAlign: TextAlign.center,
                          state.weather.location.country,
                          style: const TextStyle(
                            fontSize: 50,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${state.weather.current.tempC} °C',
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              '${state.weather.current.tempF} °F',
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        //Text(state.weather.location.localtime),

                        Text(state.weather.location.region),
                        Text(state.weather.location.name)
                      ],
                    ),
                  );
                } else if (state is WeatherError) {
                  return Center(child: Text(state.message));
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
