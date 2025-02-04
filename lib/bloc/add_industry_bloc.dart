
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_industry_event.dart';
import 'add_industry_state.dart';

class AddIndustriesBloc extends Bloc<AddIndustriesEvent,AddIndustriesState>{
  AddIndustriesBloc():super(AddInitialState()){
    on<SaveIndustriesEvent>((event, emit){
      emit(AddSuccessState());

    });
  }
}