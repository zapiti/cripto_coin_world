import 'package:crypto_app/src/feature/home/widget/item_list_cripto.dart';
import 'package:crypto_app/utils/theme/app_theme_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mundo cripto",
          style: AppThemeUtils.normalBoldSize(
              color: AppThemeUtils.colorPrimary, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
          initState: (state) {
            controller.getAllData();
          },
          builder: (_) => controller.listCriptoCoin == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.listCriptoCoin.length,
                  itemBuilder: (context, index) =>
                      ItemListCripto(controller.listCriptoCoin[index]))),
    );
  }
}
