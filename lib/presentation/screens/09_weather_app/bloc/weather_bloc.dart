import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lbloc/presentation/screens/09_weather_app/model/weather_model.dart';

import '../repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());

      await Future.delayed(const Duration(seconds: 2));

      try {
        final weather = await weatherRepository.fetchWeather(event.city);

        debugPrint(weather.toString());
        emit(WeatherLoaded(weather: weather));
      } catch (e) {
        emit(const WeatherError('Failed to fetch weather.'));
      }
    });
  }
}
