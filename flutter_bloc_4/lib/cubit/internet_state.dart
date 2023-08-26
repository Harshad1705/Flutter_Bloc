part of 'internet_cubit.dart';

@immutable
sealed class InternetState {}

final class InternetLoading extends InternetState {}

final class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  InternetConnected({required this.connectionType});
}

final class InternetDisconnected extends InternetState {}
