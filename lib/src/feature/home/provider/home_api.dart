import 'dart:ffi';

import 'package:crypto_app/src/feature/home/model/crypto_coin.dart';
import 'package:crypto_app/src/feature/home/model/evolution_coin.dart';
import 'package:crypto_app/src/feature/home/model/market_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeAPI {
  final Dio _dio = Get.find<Dio>();

  Future<List<CryptoCoin>> getListCrypto() async {
    try {
      final response = await _dio.get(
        'https://api.coincap.io/v2/assets',
      );
      return CryptoCoin.fromMapToList(response.data);
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<EvolutionCoin>> getHistoryCrypto(String coin,
      {String interval}) async {
    try {
      final response = await _dio.get(
        'https://api.coincap.io/v2/assets/${coin.toLowerCase()}/history?interval=$interval',
      );
      return EvolutionCoin.fromMapToList(response.data);
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<double> currentMoneyValueBase(String coin) async {
    try {
      final response = await _dio.get(
        'https://economia.awesomeapi.com.br/last/USD-$coin',
      );
      return double.tryParse(response.data["USD$coin"]["ask"]) ?? 1.0;
    } catch (e) {
      debugPrint(e.toString());
      return 1.0;
    }
  }

  Future<List<MarketCoin>> getListMarketCoin(String coin) async {
    try {
      final response = await _dio.get(
        'https://api.coincap.io/v2/assets/${coin.toLowerCase()}/markets',
      );
      return MarketCoin.fromMapToList(response.data);
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<String> getExchange(String exchange) async {
    try {
      final response = await _dio.get(
        'https://api.coincap.io/v2/exchanges/${exchange?.toLowerCase()?.replaceAll(" ", "")?.trim()}',
      );
      return response.data["data"]['exchangeUrl'];
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
