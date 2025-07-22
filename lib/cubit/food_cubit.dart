import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../repository/foodRepository.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  getFoods() {
    emit(LoadingState());
    var food = FoodRepository.createFood();
    print(food);
    if (food.length > 0) {
      print(" here from if");
      emit(LoadedState(food));
    } else {
      emit(ErrorState("SomeThing is wrong"));
    }
  }

  getFoodDetail(data) {
    try {
      emit(FoodLoadedState(data));
    } catch (err) {
      emit(ErrorState("err.message"));
    }
  }
}
