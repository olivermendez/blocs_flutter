import 'package:dio/dio.dart';
import 'package:lbloc/presentation/screens/09_weather_app/model/weather_model.dart';

class WeatherRepository {
  final String apiKey = 'dba633391d48410f8e004100242306';
  final String apiUrl = 'http://api.weatherapi.com/v1/current.json';
  final Dio dio = Dio();

  Future<Weather> fetchWeather(String city) async {
    try {
      final response =
          await dio.get(apiUrl, queryParameters: {'q': city, 'key': apiKey});

      if (response.statusCode == 200) {
        final data = Weather.fromJson(response.data);

        return data;
      } else {
        throw Exception('Failed to load weather');
      }
    } catch (e) {
      print(
          'Failed to load weather: $e'); // Asegúrate de que el error se imprime
      throw Exception('Failed to load weather: $e');
    }
  }
}
