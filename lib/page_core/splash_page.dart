import 'package:crypto_app/router/constants_router.dart';
import 'package:crypto_app/utils/image/image_path.dart';
import 'package:crypto_app/utils/theme/app_theme_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2)).then((value) {
        redirectToPage(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppThemeUtils.whiteColor,
        body: Material(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(width: double.infinity,height: 150,child:  Image.asset(ImagePath.imageLogo)),
          ],
        )));
  }
}

void redirectToPage(BuildContext context) {
  Future.delayed(Duration(seconds: 1), () {
    Get.offAndToNamed(ConstantsRouter.HOME);
  });
}
