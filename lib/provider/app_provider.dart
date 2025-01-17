import 'package:carRecordApp/model/car_owners_data_model.dart';
import 'package:carRecordApp/model/filter_data_car_model.dart';
import 'package:carRecordApp/model/filter_data_user_model.dart';
import 'package:carRecordApp/model/user_data_model.dart';
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  CarOwnerDataModel _ownerData;
  List<CarOwnerDataModel> _ownersDataList;
  List<CarOwnerDataModel> _ownersDataListCopy;
  List<UserDataModel> _userDataList;
  List<UserDataModel> _userDataListCopy;
  FilterUserModel _filterUserModel;
  FilterCarModel _filterCarModel;

  UserDataModel _userData;
  bool _isLoadingCarsPage = true;
  bool _isLoadingUserPage = true;

  CarOwnerDataModel get ownerData => _ownerData;
  FilterUserModel get filterUserModel => _filterUserModel;
  FilterCarModel get filterCarModel => _filterCarModel;
  List<CarOwnerDataModel> get ownersDataList => _ownersDataList;
  List<CarOwnerDataModel> get ownersDataListCopy => _ownersDataListCopy;
  List<UserDataModel> get userDataList => _userDataList;
  List<UserDataModel> get userDataListCopy => _userDataListCopy;
  bool get isLoadingCarsPage => _isLoadingCarsPage;
  bool get isLoadingUserPage => _isLoadingUserPage;
  UserDataModel get userData => _userData;

  set filterCarModel(FilterCarModel filter) {
    _filterCarModel = filter;
    notifyListeners();
  }

  set filterUserModel(FilterUserModel filter) {
    _filterUserModel = filter;
    notifyListeners();
  }

  set userData(UserDataModel data) {
    _userData = data;
    notifyListeners();
  }

  set userDataList(List<UserDataModel> data) {
    _userDataList = data;
    notifyListeners();
  }

  set userDataListCopy(List<UserDataModel> data) {
    _userDataListCopy = data;
    notifyListeners();
  }

  set ownersDataList(List<CarOwnerDataModel> data) {
    _ownersDataList = data;
    notifyListeners();
  }

  set isLoadingCarsPage(bool value) {
    _isLoadingCarsPage = value;
    notifyListeners();
  }

  set isLoadingUserPage(bool value) {
    _isLoadingUserPage = value;
    notifyListeners();
  }

  set ownersDataListCopy(List<CarOwnerDataModel> data) {
    _ownersDataListCopy = data;
    notifyListeners();
  }

  set ownerData(CarOwnerDataModel data) {
    _ownerData = data;
    notifyListeners();
  }
}
