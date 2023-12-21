part of 'loadphone_cubit.dart';

@immutable
sealed class LoadphoneState {}

final class LoadphoneInitial extends LoadphoneState {}
final class Loadphoneload extends LoadphoneState {}
// ignore: must_be_immutable
final class Loadphonesucess extends LoadphoneState {
  Iterable<Contact>conn;
  Loadphonesucess({required this.conn});
}
final class Loadphonefailure extends LoadphoneState {}