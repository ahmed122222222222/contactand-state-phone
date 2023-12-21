import 'package:bloc/bloc.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../loaddata.dart';

part 'loadphone_state.dart';

class LoadphoneCubit extends Cubit<LoadphoneState> {
  LoadphoneCubit() : super(LoadphoneInitial());
void getContacts() async{
  emit(Loadphoneload());
try {
  var res=await fetchContacts();
  emit(Loadphonesucess(conn: res));
} catch (e) {
  emit(Loadphonefailure());
}
}


}
