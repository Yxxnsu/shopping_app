import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping/constant.dart';
import 'package:getx_shopping/core/view_model/cart_view_model.dart';
import 'package:getx_shopping/view/widgets/custom_button.dart';
import 'package:getx_shopping/view/widgets/custom_text.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<CartViewModel>(
                init: Get.put(CartViewModel()),
                builder: (controller) => controller.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        child: ListView.separated(
                          itemCount: controller.cartProductModel!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 140,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      controller.cartProductModel![index].image,
                                      width: 140,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: controller
                                              .cartProductModel![index].name,
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        CustomText(
                                          text:
                                              '\$ ${controller.cartProductModel![index].price}',
                                          color: primaryColor,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 140,
                                          color: Colors.grey.shade200,
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .increaseQuantity(index);
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              CustomText(
                                                text: controller
                                                    .cartProductModel![index]
                                                    .quantity
                                                    .toString(),
                                                alignment: Alignment.center,
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    bottom: 20),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller.decreaseQuantity(
                                                        index);
                                                  },
                                                  child: const Icon(
                                                    Icons.minimize,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const CustomText(
                        text: 'TOTAL',
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<CartViewModel>(
                        init: Get.put(CartViewModel()),
                        builder: (controller) => CustomText(
                          text: '\$ ${controller.totalPrice}',
                          color: primaryColor,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    height: 100,
                    width: 180,
                    child: CustomButton(
                      onPressed: () {},
                      text: 'CHECKOUT',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
