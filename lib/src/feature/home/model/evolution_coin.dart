import 'package:get/get_rx/src/rx_types/rx_types.dart';

class EvolutionCoin {
  double priceUsd;
  double circulatingSupply;
  int time;
  DateTime date;

  EvolutionCoin({this.priceUsd, this.time, this.date,this.circulatingSupply});

  factory EvolutionCoin.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return EvolutionCoin(
      priceUsd: null == (temp = map['priceUsd'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      circulatingSupply: null == (temp = map['circulatingSupply'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      time: null == (temp = map['time'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      date: null == (temp = map['date'])
          ? null
          : (temp is DateTime ? temp : DateTime.tryParse(temp)),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'priceUsd': priceUsd,
      'time': time,
      'circulatingSupply':circulatingSupply,
      'date': date?.toString(),
    };
  }

  static List<EvolutionCoin> fromMapToList(dynamic map) {
    if (null == map) return null;
    return map["data"]
        .map<EvolutionCoin>((e) => EvolutionCoin.fromMap(e))
        .toList();
  }
}
