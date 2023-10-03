abstract class OtpState {}

final class OtpInitial extends OtpState {}

final class OtpLoading extends OtpState {}

final class OtpResend extends OtpState {}

final class OtpSuccess extends OtpState {}

final class OtpFailure extends OtpState {
  final String errmsg;

  OtpFailure({required this.errmsg});
}
