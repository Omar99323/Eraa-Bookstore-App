abstract class RegisterStates {}

final class RegisterInitial extends RegisterStates {}

final class RegisterLoading extends RegisterStates {}

final class RegisterSuccess extends RegisterStates {}

final class RegisterFailure extends RegisterStates {
  final String errmsg;

  RegisterFailure({required this.errmsg});
}
final class ChangeVisability extends RegisterStates {}

