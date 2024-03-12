import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalInitial());

  void changeLanguage({Locale locale = const Locale('en')}) async {
    emit(LocalChange(locale: locale));
  }
}
