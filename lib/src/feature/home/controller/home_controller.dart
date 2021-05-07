import 'package:crypto_app/src/feature/home/model/cripto_coin.dart';
import 'package:crypto_app/src/feature/home/model/evolution_coin.dart';
import 'package:crypto_app/src/feature/home/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _repository = Get.find<HomeRepository>();

  List<CriptoCoin> listCriptoCoin;

  List<EvolutionCoin> listHistoryCoin;

  Future<void> getAllData() async {
    listCriptoCoin = null;
    // update();
    listCriptoCoin = await _repository.getListCripto();
    update();
  }

  Future<void> getHistoryCripto(String coin, {String interval = "d1"}) async {
    listHistoryCoin = null;
    // update();
    listHistoryCoin =
        await _repository.getHistoryCripto(coin, interval: interval);
    update();
  }
}
