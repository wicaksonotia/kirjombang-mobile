import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/networks/api_request.dart';
import 'package:jombang/models/menu_model.dart';

class HomeMenuController extends GetxController {
  var menuItem = <MenuModel>[].obs;
  var isLoading = true.obs;
  RxDouble positionedLine = 0.0.obs;
  RxDouble containerWidth = 80.0.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getMenu();
      if (result != null) {
        menuItem.assignAll(result);
      }
    } catch (error) {
      Get.snackbar('Error', "Silakan cek koneksi internet anda.",
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
