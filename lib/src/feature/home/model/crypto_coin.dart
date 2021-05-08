import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CryptoCoin {
  String id;
  int rank;
  String symbol;
  String name;
  double supply;
  double maxSupply;
  double marketCapUsd;
  double volumeUsd24Hr;
  double priceUsd;
  double changePercent24Hr;
  double vwap24Hr;
  String explorer;

  static const USD = "USD";
  static const BRL = "BRL";
  static const EUR = "EUR";

  static var listCoinConvert = [
    {"Dólar (\$)": USD},
    {"Real (R\$)": BRL},
    {"Euro (€)": EUR}
  ];

  CryptoCoin(
      {this.id,
      this.rank,
      this.symbol,
      this.name,
      this.supply,
      this.maxSupply,
      this.marketCapUsd,
      this.volumeUsd24Hr,
      this.priceUsd,
      this.changePercent24Hr,
      this.vwap24Hr,
      this.explorer});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rank': rank,
      'symbol': symbol,
      'name': name,
      'supply': supply,
      'maxSupply': maxSupply,
      'marketCapUsd': marketCapUsd,
      'volumeUsd24Hr': volumeUsd24Hr,
      'priceUsd': priceUsd,
      'changePercent24Hr': changePercent24Hr,
      'vwap24Hr': vwap24Hr,
      'explorer': explorer,
    };
  }

  factory CryptoCoin.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return CryptoCoin(
      id: map['id']?.toString(),
      rank: null == (temp = map['rank'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      symbol: map['symbol']?.toString(),
      name: map['name']?.toString(),
      supply: null == (temp = map['supply'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      maxSupply: null == (temp = map['maxSupply'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      marketCapUsd: null == (temp = map['marketCapUsd'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      volumeUsd24Hr: null == (temp = map['volumeUsd24Hr'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      priceUsd: null == (temp = map['priceUsd'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      changePercent24Hr: null == (temp = map['changePercent24Hr'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      vwap24Hr: null == (temp = map['vwap24Hr'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      explorer: map['explorer']?.toString(),
    );
  }

  static List<CryptoCoin> fromMapToList(dynamic map) {
    if (null == map) return null;
    return map["data"].map<CryptoCoin>((e) => CryptoCoin.fromMap(e)).toList();
  }
}
