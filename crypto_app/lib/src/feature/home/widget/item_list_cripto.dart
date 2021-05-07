import 'package:crypto_app/router/constants_router.dart';
import 'package:crypto_app/src/feature/home/model/cripto_coin.dart';
import 'package:crypto_app/utils/theme/app_theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class ItemListCripto extends StatelessWidget {
  final CriptoCoin criptoCoin;

  ItemListCripto(this.criptoCoin);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.toNamed('${ConstantsRouter.HOME_DETAIL}',parameters: {ConstantsRouter.HOME_PARAM:criptoCoin.name});
        },
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    criptoCoin.name,
                    style: AppThemeUtils.normalSize(),
                  ),
                )),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    MoneyMaskedTextController(
                            initialValue: criptoCoin.priceUsd, leftSymbol: "\$")
                        .text,
                    style: AppThemeUtils.normalBoldSize(
                        color: AppThemeUtils.colorPrimary),
                  ),
                )
              ],
            ),
            Divider()
          ],
        ));
  }
}
