part of 'user_cubit.dart';

enum Status {
  initial,
  loading,
  loaded,
  error
}

class UserState extends Equatable {
  const UserState({this.userModel, required this.status});
  final Status status;
  final List<UserModel>? userModel;

  @override
  List<Object> get props => [];
}



