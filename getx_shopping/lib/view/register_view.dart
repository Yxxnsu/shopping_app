import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_shopping/core/view_model/auth_view_model.dart';
import 'package:getx_shopping/view/widgets/custom_button.dart';
import 'package:getx_shopping/view/widgets/custom_text.dart';
import 'package:getx_shopping/view/widgets/custom_text_form_field.dart';

import 'auth/login_screen.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get primaryColor => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Get.off(const LoginScreen());
          },
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const CustomText(
                text: "Sign Up",
                fontSize: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: "Name",
                hint: 'Yeonsu',
                onSave: (value) {
                  controller.name = value;
                },
                vaildator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: "Email",
                hint: 'Yxxnsu@gmail.com',
                onSave: (value) {
                  controller.email = value;
                },
                vaildator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                text: "Password",
                hint: '********',
                onSave: (value) {
                  controller.password = value;
                },
                vaildator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'SIGN UP',
                onPressed: () {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    controller.createAccountWithEmailAndPassword();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
