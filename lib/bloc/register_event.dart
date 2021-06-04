import 'package:equatable/equatable.dart';
import 'package:medicare/model/user_data.dart';

abstract class RegisterEvent extends Equatable{}

class RegisterUser extends RegisterEvent{

   final UserData userData;

  RegisterUser({required this.userData});

  @override
  // TODO: implement props
  List<Object> get props =>[];
}

