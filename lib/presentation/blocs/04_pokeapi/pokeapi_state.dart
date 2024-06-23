part of 'pokeapi_cubit.dart';

sealed class PokeapiState extends Equatable {
  const PokeapiState();

  @override
  List<Object> get props => [];
}

class PokeapiInitial extends PokeapiState {
  final String defaulImage;
  const PokeapiInitial({this.defaulImage = 'https://placehold.co/600x400.png'});

  @override
  List<Object> get props => [defaulImage];
}

class PokeapiLoading extends PokeapiState {}

class PokeapiLoaded extends PokeapiState {
  final String image;
  const PokeapiLoaded({required this.image});

  @override
  List<Object> get props => [image];
}

class ApiError extends PokeapiState {
  final String message;

  const ApiError(this.message);

  @override
  List<Object> get props => [message];
}
