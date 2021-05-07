import 'package:crypto_app/src/feature/home/model/cripto_coin.dart';
import 'package:crypto_app/src/feature/home/model/evolution_coin.dart';
import 'package:crypto_app/src/feature/home/provider/home_api.dart';
import 'package:get/get.dart';

class HomeRepository {
  final HomeAPI _api = Get.find<HomeAPI>();

  Future<List<CriptoCoin>> getListCripto() => _api.getListCripto();

  Future<List<EvolutionCoin>> getHistoryCripto(String coin,
          {String interval}) =>
      _api.getHistoryCripto(coin, interval: interval);
}
