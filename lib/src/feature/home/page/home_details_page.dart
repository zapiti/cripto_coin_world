import 'package:crypto_app/router/constants_router.dart';

import 'package:crypto_app/src/feature/home/page/tab/tab_evolution_child.dart';
import 'package:crypto_app/src/feature/home/page/tab/tab_where_to_buy_child.dart';

import 'package:crypto_app/utils/theme/app_theme_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeDetailsPage extends StatefulWidget {
  @override
  _HomeDetailsPageState createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            Get.parameters[ConstantsRouter.HOME_PARAM] ?? "",
            style: AppThemeUtils.normalBoldSize(
                color: AppThemeUtils.colorPrimary, fontSize: 20),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: AppThemeUtils.black,
            labelColor: AppThemeUtils.colorPrimary,
            tabs: [Tab(text: "Onde comprar?"), Tab(text: "Evolução")],
            controller: _tabController,
            onTap: (index) {
              print(index);
            },
          ),
        ),
        body: TabBarView(controller: _tabController, children: [
          TabWhereToBuyChild(),
          TabEvolutionChild(),
        ]));
  }
}
