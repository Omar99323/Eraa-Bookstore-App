abstract class CheckOutState {}

final class CheckOutInitial extends CheckOutState {}

final class CheckOut extends CheckOutState {}

final class GetCities extends CheckOutState {}
final class MakeAnOrder extends CheckOutState {}
