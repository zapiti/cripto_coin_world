import 'dart:ffi';

import 'package:crypto_app/src/feature/home/model/crypto_coin.dart';
import 'package:crypto_app/src/feature/home/model/evolution_coin.dart';
import 'package:crypto_app/src/feature/home/model/market_coin.dart';
import 'package:crypto_app/src/feature/home/provider/home_api.dart';
import 'package:get/get.dart';

class HomeRepository {
  final HomeAPI _api = Get.find<HomeAPI>();

  Future<List<CryptoCoin>> getListCrypto() => _api.getListCrypto();

  Future<List<EvolutionCoin>> getHistoryCrypto(String coin,
          {String interval}) =>
      _api.getHistoryCrypto(coin, interval: interval);

  Future<double> currentMoneyValueBase(String coin) =>
      _api.currentMoneyValueBase(coin);

  Future<List<MarketCoin>> getListMarketCoin(String coin) =>
      _api.getListMarketCoin(coin);

  Future<String> getExchange(String exchange)  =>
      _api.getExchange(exchange);
  
}
