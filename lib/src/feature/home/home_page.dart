import 'package:crypto_app/src/components/select/select_button.dart';
import 'package:crypto_app/src/feature/home/model/crypto_coin.dart';
import 'package:crypto_app/src/feature/home/widget/item_list_crypto.dart';

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
          "Mundo Crypto",
          style: AppThemeUtils.normalBoldSize(
              color: AppThemeUtils.colorPrimary, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
          initState: (state) {
            controller.getAllData();
          },
          builder: (_) => controller.listCryptoCoin == null
              ? Center(child: CircularProgressIndicator())
              : Column(
            mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Valor das moedas em:",
                        style: AppThemeUtils.normalSize(
                            color: AppThemeUtils.colorPrimary),
                      ),
                      margin: EdgeInsets.all(10),
                    ),
                    SelectButton(
                      listItens: CryptoCoin.listCoinConvert,
                      initialItem: CryptoCoin.listCoinConvert.first,
                      tapIndex: (selected) =>
                          controller.currentMoneyValueBase(selected),
                    ),
                    Divider(),
                    Expanded(
                        child: ListView.builder(
                            itemCount: controller.listCryptoCoin.length,
                            itemBuilder: (context, index) => ItemListCrypto(
                                controller.listCryptoCoin[index])))
                  ],
                )),
    );
  }
}
