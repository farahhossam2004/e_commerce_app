import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_progress_state.dart';

class OnboardingProgressCubit extends Cubit<OnboardingProgressState> {
  double progress = 0.5;
  OnboardingProgressCubit() : super(OnboardingProgressInitial());

  void inceasreProgress(int index) {
    if (index == 1) {
      progress = 0.5;
      emit(OnboardingProgress());
    } else if (index == 2) {
      progress = 0.75;
      emit(OnboardingProgress());
    } else if (index == 3) {
      progress = 1;
      emit(OnboardingProgress());
    }
  }
}
