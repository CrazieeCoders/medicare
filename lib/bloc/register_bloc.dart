import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/bloc/register_event.dart';
import 'package:medicare/bloc/register_state.dart';
import 'package:medicare/db/data_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{

  DataRepository dataRepository = DataRepository();

  RegisterBloc() : super(InitialRegisterState());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async*{
    // TODO: implement mapEventToState

    if(event is RegisterUser){
      try {
        yield RegisterLoadingState();
        dataRepository.registerUser(event.userData);
        yield RegisterSuccessState();
      }catch(e){
        yield RegisterFailedState();
      }
    }
  }

}