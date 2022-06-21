import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_shopping/constant.dart';
import 'package:getx_shopping/core/view_model/cart_view_model.dart';
import 'package:getx_shopping/model/cart_product_model.dart';

import 'package:getx_shopping/model/product_model.dart';
import 'package:getx_shopping/view/widgets/custom_button.dart';
import 'package:getx_shopping/view/widgets/custom_text.dart';

class DetailsView extends StatelessWidget {
  final ProductModel? model;

  const DetailsView({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: Image.network(
                  model!.image,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 60,
                left: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: Colors.black,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    CustomText(
                      text: model!.name,
                      fontSize: 26,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomText(
                                text: 'Size',
                              ),
                              CustomText(
                                text: model!.sized,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width * .44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomText(
                                text: 'Color',
                              ),
                              Container(
                                width: 30,
                                height: 20,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                  color: model!.color,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomText(
                      text: 'Details',
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: model!.description,
                      fontSize: 18,
                      height: 2.5,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const CustomText(
                      text: "PRICE ",
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                    CustomText(
                      text: ' \$' + model!.price,
                      color: primaryColor,
                      fontSize: 18,
                    )
                  ],
                ),
                GetBuilder<CartViewModel>(
                  init: CartViewModel(),
                  builder: (controller) => Container(
                    padding: const EdgeInsets.all(20),
                    width: 180,
                    height: 100,
                    child: CustomButton(
                      onPressed: () {
                        controller.addProduct(
                          CartProductModel(
                            name: model!.name,
                            image: model!.image,
                            price: model!.price,
                            quantity: 1,
                            productId: model!.productId,
                          ),
                        );
                        print('Product ADD');
                      },
                      text: 'Add',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
