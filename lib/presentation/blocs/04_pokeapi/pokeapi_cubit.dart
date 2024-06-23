import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../config/helpers/cat_repo.dart';

part 'pokeapi_state.dart';

class PokeapiCubit extends Cubit<PokeapiState> {
  PokeapiCubit() : super(const PokeapiInitial());

  Future<void> fetchCat() async {
    emit(PokeapiLoading());
    Future.delayed(const Duration(seconds: 5));

    try {
      final response = await CatApiRepo.getPokeName();
      emit(PokeapiLoaded(image: response));
    } catch (e) {
      emit(ApiError(e.toString()));
    }
  }
}
