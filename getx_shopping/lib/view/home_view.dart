import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping/constant.dart';
import 'package:getx_shopping/core/view_model/home_view_model.dart';
import 'package:getx_shopping/view/widgets/custom_text.dart';

import 'details_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeViewModel>(
        init: Get.put(HomeViewModel()),
        builder: (controller) => controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 100, left: 20, right: 20),
                    child: Column(
                      children: [
                        const SearchTextFormField(),
                        const SizedBox(
                          height: 30,
                        ),
                        const CustomText(
                          text: 'Categories',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        _listViewCategory(),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CustomText(
                              text: "Best Selling",
                              fontSize: 18,
                            ),
                            CustomText(
                              text: "See all",
                              fontSize: 16,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        _listViewProducts(),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => SizedBox(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: controller.categoryModel[index].name,
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(width: 20),
        ),
      ),
    );
  }
}

Widget _listViewProducts() {
  return GetBuilder<HomeViewModel>(
    builder: (controller) => Container(
      height: 320,
      child: ListView.separated(
        itemCount: controller.productModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // ProductModel model = controller.productModel[index];
          return GestureDetector(
            onTap: () {
              Get.to(
                () => DetailsView(
                  model: controller.productModel[index],
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100,
                    ),
                    child: SizedBox(
                      height: 220,
                      width: MediaQuery.of(context).size.width * .4,
                      child: Image.network(
                        controller.productModel[index].image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: controller.productModel[index].name,
                    alignment: Alignment.bottomLeft,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: CustomText(
                      text: controller.productModel[index].description,
                      color: Colors.grey,
                      alignment: Alignment.bottomLeft,
                      maxLine: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text:
                        "\$" + controller.productModel[index].price.toString(),
                    color: primaryColor,
                    alignment: Alignment.bottomLeft,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
      ),
    ),
  );
}

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade100,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
