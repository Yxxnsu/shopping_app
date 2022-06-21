import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_shopping/core/view_model/auth_view_model.dart';

import 'package:getx_shopping/core/view_model/control_view_model.dart';
import 'package:getx_shopping/view/auth/login_screen.dart';

class ControllView extends GetWidget<AuthViewModel> {
  const ControllView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return (Get.find<AuthViewModel>().user == null)
            ? const LoginScreen()
            : GetBuilder<ControlViewModel>(
                builder: (controller) => Scaffold(
                  body: controller.currentScreen,
                  bottomNavigationBar: bottomNavigationBar(),
                ),
              );
      },
    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          bottomNavigationItems('Explore', 'assets/images/Icon_Explore.png'),
          bottomNavigationItems('Cart', 'assets/images/Icon_Cart.png'),
          bottomNavigationItems('Account', 'assets/images/Icon_User.png'),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationItems(String text, String imagePath) {
    return BottomNavigationBarItem(
      activeIcon: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Text(
          text,
        ),
      ),
      label: '',
      icon: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          width: 20,
        ),
      ),
    );
  }
}
