import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable{}


class InitialRegisterState extends RegisterState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class RegisterLoadingState extends RegisterState{
  @override
  // TODO: implement props
  List<Object> get props =>[];
}

class RegisterSuccessState extends RegisterState{
  @override
  // TODO: implement props
  List<Object> get props =>[];
}

class RegisterFailedState extends RegisterState{
  @override
  // TODO: implement props
  List<Object> get props =>[];
}