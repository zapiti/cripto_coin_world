import 'dart:io';

import 'package:crypto_app/router/constants_router.dart';
import 'package:crypto_app/src/feature/home/controller/home_controller.dart';
import 'package:crypto_app/utils/theme/app_theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExchangeWebViewPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.parameters[ConstantsRouter.EXCHANGE_PARAM],
          style: AppThemeUtils.normalBoldSize(
              color: AppThemeUtils.colorPrimary, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
          initState: (state) {
            if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
            controller
                .getExchange(Get.parameters[ConstantsRouter.EXCHANGE_PARAM]);
          },
          builder: (_) => controller.urlExchange == null
              ? Center(child: CircularProgressIndicator())
              : WebView(
                  initialUrl: controller.urlExchange,
                )),
    );
  }
}
