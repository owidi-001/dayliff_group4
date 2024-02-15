import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum VerificationMeans { OTP, ID }

class VerifyCustomerCubit extends Cubit<VerifyCustomerState> {
  VerifyCustomerCubit() : super( VerifyCustomerState());

  void meansChanged(VerificationMeans means) {
    // emit();
  }

  bool validateOtp() {
    return false;
  }

  // Edit otp change state
  void otpChanged(String value) {}
}

class VerifyCustomerState extends Equatable {
  final VerificationMeans selectedMeans;

  const VerifyCustomerState({this.selectedMeans=VerificationMeans.OTP});

  VerifyCustomerState copyWith({VerificationMeans? selectedMeans}) {
    return VerifyCustomerState(
        selectedMeans: selectedMeans ?? this.selectedMeans);
  }

  @override
  List<Object> get props => [];
}
