import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_shopping/core/view_model/profile_view_model.dart';
import 'package:getx_shopping/view/auth/login_screen.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              controller.signOut();
              Get.offAll(const LoginScreen());
            },
            child: const Text('Sign Out'),
          ),
        ),
      ),
    );
  }
}
