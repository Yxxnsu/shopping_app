import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_shopping/view/cart_view.dart';
import 'package:getx_shopping/view/home_view.dart';
import 'package:getx_shopping/view/profile_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget currentScreen = const HomeView();
  get navigatorValue => _navigatorValue;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = const HomeView();
          break;
        }
      case 1:
        {
          currentScreen = const CartView();
          break;
        }
      case 2:
        {
          currentScreen = const ProfileView();
          break;
        }
    }
    update();
  }
}
