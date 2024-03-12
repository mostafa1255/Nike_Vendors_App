part of 'local_cubit.dart';

@immutable
sealed class LocalState {}

final class LocalInitial extends LocalState {}

final class LocalChange extends LocalState {
  final Locale locale;

  LocalChange({required this.locale});
}
