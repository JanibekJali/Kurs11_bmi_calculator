part of 'home_cubit.dart';

class HomeState extends Equatable {
  HomeState({
    this.currentHeightState,
    this.weight,
    this.age,
    this.maleSelected,
    this.femaleSelected,
  });
  double? currentHeightState;
  int? weight;
  int? age;
  // Color? maleSelected = AppColors.inactiveColor;
  Color? maleSelected;
  // Color? femaleSelected = AppColors.inactiveColor;
  Color? femaleSelected;

  @override
  List<Object?> get props => [
        currentHeightState,
        weight,
        age,
        maleSelected,
        femaleSelected,
      ];
  HomeState copyWith({
    double? currentHeightState,
    int? weight,
    int? age,
    Color? maleSelected,
    Color? femaleSelected,
  }) {
    return HomeState(
      currentHeightState: currentHeightState ?? this.currentHeightState,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      maleSelected: maleSelected ?? this.maleSelected,
      femaleSelected: femaleSelected ?? this.femaleSelected,
    );
  }
}
