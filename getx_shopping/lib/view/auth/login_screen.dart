import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping/constant.dart';
import 'package:getx_shopping/core/view_model/auth_view_model.dart';
import 'package:getx_shopping/view/register_view.dart';
import 'package:getx_shopping/view/widgets/custom_button.dart';
import 'package:getx_shopping/view/widgets/custom_button_social.dart';
import 'package:getx_shopping/view/widgets/custom_text.dart';

import '../widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: "Welcome,",
                    fontSize: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => RegisterScreen());
                    },
                    child: const CustomText(
                      text: "Sign up",
                      color: primaryColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text: "Sign in to Continue",
                fontSize: 14,
                color: Colors.grey,
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
              const CustomText(
                text: 'Forgot Password?',
                fontSize: 14,
                alignment: Alignment.topRight,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                text: 'SIGN IN',
                onPressed: () {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    controller.signInWithEmailAndPassword();
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomText(
                text: '-OR-',
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                text: 'Sign In with Google',
                imageName: 'assets/images/google.png',
                onPress: () {
                  controller.googleSignInMethod();
                },
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                imageName: 'assets/images/facebook.png',
                text: 'Sign In with Facebook',
                onPress: () {
                  print('Login with facebook');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
