import 'package:crypto_app/router/constants_router.dart';
import 'package:crypto_app/src/feature/home/controller/home_controller.dart';
import 'package:crypto_app/src/feature/home/widget/item_list_market_crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';

class TabWhereToBuyChild extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        initState: (state) {
          controller
              .getMarketCoin(Get.parameters[ConstantsRouter.HOME_PARAM]);
        },
        builder: (_) =>
        controller.listMarketCoin == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
            itemCount: controller.listMarketCoin.length,
            itemBuilder: (context, index) => ItemListMarketCrypto(
                controller.listMarketCoin[index])));
  }
}
