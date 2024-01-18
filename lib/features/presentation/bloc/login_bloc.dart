import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pv_smart_click/core/resources/data_state.dart';
import 'package:pv_smart_click/features/domain/entities/login_response.dart';
import 'package:pv_smart_click/features/domain/usecases/post_login.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PostLoginUseCase _postLoginUseCase;

  LoginBloc(this._postLoginUseCase) : super(const LoginLoading()) {
    on<PostLogin>(onPostLogin);
  }

  Future<void> onPostLogin(PostLogin event, Emitter<LoginState> emmit) async {
    final dataState = await _postLoginUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(LoginDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(LoginError(dataState.error!));
    }
  }
}
