abstract class LoginStates {}

final class LoginInitial extends LoginStates {}

final class ChangeVisability extends LoginStates {}

final class LoginSuccess extends LoginStates {
  final String page;

  LoginSuccess({required this.page});
}

final class LoginLoading extends LoginStates {}

final class LoginFailure extends LoginStates {
  final String errmsg;

  LoginFailure({required this.errmsg});
}
