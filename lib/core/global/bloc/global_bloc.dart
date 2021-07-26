import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_man/core/global/provider/global_provider.dart';

import 'global_event.dart';

part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final BuildContext context;
  GlobalBloc(this.context) : super(null);

  @override
  Stream<GlobalState> mapEventToState(GlobalEvent event) async* {
    if (event is CheckStatus) {
      yield* _checkStatus();
    } else if (event is SignIn) {

    } else if (event is SignOut) {

    }
  }

  Stream<GlobalState> _checkStatus() async* {
    GlobalProvider globalProvider = Provider.of<GlobalProvider>(context, listen: false);
    await globalProvider.getOnBoardingStatus();
    bool signInStatus = globalProvider.signInStatus;

    if (!signInStatus) {
      yield NotSignedIn();
    } else {
      yield SignedIn();
    }


  }

}
