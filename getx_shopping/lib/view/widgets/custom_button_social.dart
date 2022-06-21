import 'package:flutter/material.dart';
import 'package:getx_shopping/view/widgets/custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final Function()? onPress;

  const CustomButtonSocial({
    Key? key,
    required this.text,
    required this.imageName,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.grey.shade100,
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Image.asset(imageName),
            const SizedBox(
              width: 90,
            ),
            CustomText(
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}
