import 'package:dio/dio.dart';

class PokeInfo {
  static Future<String> getPokeName(int pokeId) async {
    final dio = Dio();

    await Future.delayed(const Duration(seconds: 2));
    try {
      final rsp =
          await dio.get('https://pokeapi.co/api/v2/pokemon-species/aegislash');
      return rsp.data['base_happiness'] ?? "no found";
    } catch (e) {
      return "Error getting name";
    }
  }
}
