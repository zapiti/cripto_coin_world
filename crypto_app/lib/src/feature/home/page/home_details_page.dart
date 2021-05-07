import 'package:crypto_app/router/constants_router.dart';
import 'package:crypto_app/src/feature/home/controller/home_controller.dart';
import 'package:crypto_app/src/feature/home/model/evolution_coin.dart';
import 'package:crypto_app/utils/date/date_utils.dart';
import 'package:crypto_app/utils/theme/app_theme_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeDetailsPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.parameters[ConstantsRouter.HOME_PARAM],
          style: AppThemeUtils.normalBoldSize(
              color: AppThemeUtils.colorPrimary, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
          initState: (state) {
            controller
                .getHistoryCripto(Get.parameters[ConstantsRouter.HOME_PARAM]);
          },
          builder: (_) => controller.listHistoryCoin == null
              ? Center(child: CircularProgressIndicator())
              : Column(children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          title: ChartTitle(text: 'Evolução da moeda em dolar'),
                          legend: Legend(isVisible: false),
                          primaryYAxis: NumericAxis(
                              numberFormat: NumberFormat.simpleCurrency()),
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <ChartSeries<EvolutionCoin, String>>[
                            LineSeries<EvolutionCoin, String>(
                                dataSource: controller.listHistoryCoin,
                                pointColorMapper: (EvolutionCoin coin, _) =>
                                    AppThemeUtils.colorPrimary,
                                xValueMapper: (EvolutionCoin coin, _) =>
                                    MyDateUtils.convertStringServer(coin.date,
                                        format: "dd/MM/yyyy"),
                                yValueMapper: (EvolutionCoin coin, _) =>
                                    coin.priceUsd,
                                name: 'Valor em dolar',
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: false))
                          ])),
                ])),
    );
  }
}
