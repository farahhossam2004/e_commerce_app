part of 'onboarding_progress_cubit.dart';

@immutable
sealed class OnboardingProgressState {}

final class OnboardingProgressInitial extends OnboardingProgressState {}

final class OnboardingProgress extends OnboardingProgressState{}