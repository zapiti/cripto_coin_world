import 'package:crypto_app/src/feature/home/model/crypto_coin.dart';
import 'package:crypto_app/src/feature/home/model/evolution_coin.dart';
import 'package:crypto_app/src/feature/home/model/market_coin.dart';
import 'package:crypto_app/src/feature/home/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _repository = Get.find<HomeRepository>();

  RxDouble valueConversion = 1.0.obs;

  List<CryptoCoin> listCryptoCoin;

  List<EvolutionCoin> listHistoryCoin;

  List<MarketCoin> listMarketCoin;

  String urlExchange;

  var loadCoin = false.obs;

  Map typeCoinConversion;

  Future<void> getAllData() async {
    listCryptoCoin = null;
    listCryptoCoin = await _repository.getListCrypto();
    update();
  }

  Future<void> getHistoryCrypto(String coin, {String interval = "d1"}) async {
    listHistoryCoin = null;
    listHistoryCoin =
        await _repository.getHistoryCrypto(coin, interval: interval);
    update();
  }

  currentMoneyValueBase(Map<String, String> selected) async {
    typeCoinConversion = selected;
    loadCoin =  RxBool(true);
    update();
    if (selected == CryptoCoin.listCoinConvert.first) {
      valueConversion = RxDouble(1);
    } else {
      final valueDolarToCoin =
          await _repository.currentMoneyValueBase(selected.values.first);
      valueConversion = RxDouble(valueDolarToCoin);
    }
    loadCoin = RxBool(false);
    update();
  }

  String getCoinSymbol() {
    if (typeCoinConversion?.values?.first == CryptoCoin.EUR) {
      return "€ ";
    } else if (typeCoinConversion?.values?.first == CryptoCoin.BRL) {
      return "R\$ ";
    } else {
      return "\$ ";
    }
  }

  Future<void> getMarketCoin(String coin) async {
    listMarketCoin = null;
    listMarketCoin =
    await _repository.getListMarketCoin(coin);
    update();
  }

  void getExchange(String exchange) async{
    urlExchange = null;
    urlExchange =
        await _repository.getExchange(exchange);
    update();
  }
}
