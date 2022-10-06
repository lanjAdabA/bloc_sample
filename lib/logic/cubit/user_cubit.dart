import 'dart:convert';
import 'dart:developer';

import 'package:bloc_example/model/user.model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState(status: Status.initial));

  bool get isLoading => Status.loading == state.status;

  Future getData() async {
    if (isLoading) {
      log("Already fetching data");
      return;
    }

    try {
      const UserState(status: Status.loading);
      var res = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (res.statusCode == 200) {
        var raw = jsonDecode(res.body) as List;

        var users = raw.map((e) => UserModel.fromJson(e)).toList();

        emit(UserState(status: Status.loaded, userModel: users));
      }

      if (res.statusCode != 200) {
        emit(const UserState(
          status: Status.error,
        ));
      }
    } catch (e) {
      emit(const UserState(
        status: Status.error,
      ));
    }
  }
}
