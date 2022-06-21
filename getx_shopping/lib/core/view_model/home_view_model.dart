import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_shopping/core/service/home_services.dart';
import 'package:getx_shopping/model/category_model.dart';
import 'package:getx_shopping/model/product_model.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  final List<ProductModel> _productsModel = [];
  List<ProductModel> get productModel => _productsModel;

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    await HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
        _loading.value = false;
      }
    });
    print(_categoryModel.length);
    update();
  }

  getBestSellingProducts() async {
    _loading.value = true;
    await HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productsModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
    });
    print(_productsModel.length);
    update();
  }
}
