import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping/core/view_model/auth_view_model.dart';

/// stateManagement
/// getBuilder -- not reactive
/// Getx -- reactive -- stream
/// obx -

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthViewModel viewModel = Get.put(AuthViewModel());

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    );
  }
}
