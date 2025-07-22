part of 'food_cubit.dart';

abstract class FoodState extends Equatable {}

class FoodInitial extends FoodState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends FoodState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends FoodState {
  final foods;
  LoadedState(this.foods);
  @override
  List<Object?> get props => [foods];
}

class ErrorState extends FoodState {
  final String err;
  ErrorState(this.err);
  @override
  List<Object?> get props => [err];
}

class FoodLoadedState extends FoodState {
  final food;
  FoodLoadedState(this.food);
  @override
  List<Object?> get props => [food];
}
