class MarketCoin {
  String exchangeId;
  String baseId;
  String quoteId;
  String baseSymbol;
  String quoteSymbol;
  double volumeUsd24Hr;
  double priceUsd;
  double volumePercent;

  int updated;

  MarketCoin(
      {this.exchangeId,
      this.baseId,
      this.quoteId,
      this.baseSymbol,
      this.quoteSymbol,
      this.volumeUsd24Hr,
      this.priceUsd,this.updated,
      this.volumePercent});

  factory MarketCoin.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return MarketCoin(
      exchangeId: map['exchangeId']?.toString(),
      baseId: map['baseId']?.toString(),
      quoteId: map['quoteId']?.toString(),
      baseSymbol: map['baseSymbol']?.toString(),
      quoteSymbol: map['quoteSymbol']?.toString(),
      volumeUsd24Hr: null == (temp = map['volumeUsd24Hr'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      priceUsd: null == (temp = map['priceUsd'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      volumePercent: null == (temp = map['volumePercent'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      updated: null == (temp = map['updated'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'exchangeId': exchangeId,
      'baseId': baseId,
      'quoteId': quoteId,
      'baseSymbol': baseSymbol,
      'quoteSymbol': quoteSymbol,
      'volumeUsd24Hr': volumeUsd24Hr,
      'priceUsd': priceUsd,
      'volumePercent': volumePercent,
      'updated':updated
    };
  }

  static List<MarketCoin> fromMapToList(dynamic map) {
    if (null == map) return null;
    return map["data"].map<MarketCoin>((e) => MarketCoin.fromMap(e)).toList();
  }
}
