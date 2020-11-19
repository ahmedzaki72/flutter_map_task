import 'package:flutter/material.dart';
import 'package:flutter_map/modals/office_modal.dart';
import 'package:flutter_map/network/api_services.dart';




class OfficesProvider extends ChangeNotifier{
  List<Office> _officesList = [];

  Future<void> fetchOffices() async{
    _officesList = await Apis().fetchingOffice();
    notifyListeners();
  }

  List<Office> get officesList => _officesList;
}