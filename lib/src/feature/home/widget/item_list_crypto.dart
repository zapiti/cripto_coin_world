import 'package:crypto_app/router/constants_router.dart';
import 'package:crypto_app/src/feature/home/controller/home_controller.dart';
import 'package:crypto_app/src/feature/home/model/crypto_coin.dart';

import 'package:crypto_app/utils/theme/app_theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class ItemListCrypto extends GetView<HomeController> {
  final CryptoCoin cryptoCoin;

  ItemListCrypto(this.cryptoCoin);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.toNamed('${ConstantsRouter.HOME_DETAIL}',
              parameters: {ConstantsRouter.HOME_PARAM: cryptoCoin.name});
        },
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    cryptoCoin.name,
                    style: AppThemeUtils.normalSize(),
                  ),
                )),
                Container(
                    margin: EdgeInsets.all(20),
                    child: GetX<HomeController>(
                      builder: (controller) => controller.loadCoin.value
                          ? CircularProgressIndicator()
                          : Text(
                              MoneyMaskedTextController(
                                      initialValue: cryptoCoin.priceUsd *
                                          controller.valueConversion.value,
                                      leftSymbol: controller.getCoinSymbol())
                                  .text,
                              style: AppThemeUtils.normalBoldSize(
                                  color: AppThemeUtils.colorPrimary),
                            ),
                    )),
                Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppThemeUtils.colorPrimary,
                    ))
              ],
            ),
            Divider()
          ],
        ));
  }
}
