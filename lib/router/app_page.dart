import 'package:crypto_app/page_core/splash_page.dart';
import 'package:crypto_app/src/feature/home/home_binding.dart';
import 'package:crypto_app/src/feature/home/home_page.dart';
import 'package:crypto_app/src/feature/home/page/home_details_page.dart';
import 'package:crypto_app/src/feature/home/page/web_view/exchange_webview_page.dart';
import 'package:get/get.dart';

import 'constants_router.dart';

class AppPage {
  static var list = [
    GetPage(
      name: '/',
      page: () => SplashPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: ConstantsRouter.HOME,
        page: () => HomePage(),
        binding: HomeBinding()),
    GetPage(
      name: '${ConstantsRouter.HOME_DETAIL}',
      page: () => HomeDetailsPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '${ConstantsRouter.EXCHANGE_DETAIL}',
      page: () => ExchangeWebViewPage(),
      transition: Transition.rightToLeft,
    ),
  ];
}
