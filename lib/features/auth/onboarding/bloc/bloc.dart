import 'package:dayliff/features/auth/onboarding/models/content.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState(position: 0)) {
    on<PageChangedEvent>((event, emit) {
      print("Page next clicked");
      emit(state.copyWith(event.position));
      // state.pageController.animateToPage(event.position,
      //     duration: const Duration(milliseconds: 800),
      //     curve: Curves.bounceInOut);
    });
  }
}

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class PageChangedEvent extends OnboardingEvent {
  final int position;

  const PageChangedEvent({required this.position});
}

class OnboardingState extends Equatable {
  OnboardingState({required this.position});

  int position = 0;
  final PageController pageController = PageController(initialPage: 0);

  final contents = [
    OnboardingContent(
      imageUrl: 'assets/carousel/1.jpg',
      title: 'Welcome to Daylivery',
      description:
          'Join us as an external truck driver and be a part of our efficient transportation network.',
    ),
    OnboardingContent(
      imageUrl: 'assets/carousel/4.jpg',
      title: 'Flexible Schedule',
      description:
          'Drive on your own schedule. We offer flexible working hours to suit your lifestyle.',
    ),
    OnboardingContent(
      imageUrl: 'assets/carousel/5.jpg',
      title: 'Competitive Pay',
      description:
          'Earn competitive compensation for your services and ensure a stable income.',
    ),
  ];

  OnboardingState copyWith(int? position) {
    return OnboardingState(position: position ?? this.position);
  }

  @override
  List<Object> get props => [contents, position, pageController];
}
