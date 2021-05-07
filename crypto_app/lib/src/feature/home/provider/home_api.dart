import 'package:crypto_app/src/feature/home/model/cripto_coin.dart';
import 'package:crypto_app/src/feature/home/model/evolution_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeAPI {
  final Dio _dio = Get.find<Dio>();

  Future<List<CriptoCoin>> getListCripto() async {
    try {
      final response = await _dio.get(
        'https://api.coincap.io/v2/assets',
      );
      return CriptoCoin.fromMapToList(response.data);
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<EvolutionCoin>> getHistoryCripto(String coin,{String interval}) async {
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
}
