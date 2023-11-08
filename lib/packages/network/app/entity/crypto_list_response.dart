// To parse this JSON data, do
//
//     final cryptoListResponse = cryptoListResponseFromJson(jsonString);

import 'dart:convert';

CryptoListResponse cryptoListResponseFromJson(String str) =>
    CryptoListResponse.fromJson(json.decode(str));

String cryptoListResponseToJson(CryptoListResponse data) =>
    json.encode(data.toJson());

class CryptoListResponse {
  final Status? status;
  final List<Datum>? data;

  CryptoListResponse({
    this.status,
    this.data,
  });

  factory CryptoListResponse.fromJson(Map<String, dynamic> json) =>
      CryptoListResponse(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  String? name;
  final String? symbol;
  final String? slug;
  final int? cmcRank;
  final int? numMarketPairs;
  final int? circulatingSupply;
  final int? totalSupply;
  final int? maxSupply;
  final DateTime? lastUpdated;
  final DateTime? dateAdded;
  final List<String>? tags;
  final dynamic platform;
  String? logo;
  final Map<String, Quote>? quote;

  Datum({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.cmcRank,
    this.numMarketPairs,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.lastUpdated,
    this.dateAdded,
    this.tags,
    this.platform,
    this.quote,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        cmcRank: json["cmc_rank"],
        numMarketPairs: json["num_market_pairs"],
        circulatingSupply: json["circulating_supply"],
        totalSupply: json["total_supply"],
        maxSupply: json["max_supply"],
        lastUpdated: json["last_updated"] == null
            ? null
            : DateTime.parse(json["last_updated"]),
        dateAdded: json["date_added"] == null
            ? null
            : DateTime.parse(json["date_added"]),
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        platform: json["platform"],
        quote: Map.from(json["quote"]!)
            .map((k, v) => MapEntry<String, Quote>(k, Quote.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "cmc_rank": cmcRank,
        "num_market_pairs": numMarketPairs,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "last_updated": lastUpdated?.toIso8601String(),
        "date_added": dateAdded?.toIso8601String(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "platform": platform,
        "quote": Map.from(quote!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Quote {
  final double? price;
  final int? volume24H;
  final double? percentChange1H;
  final double? percentChange24H;
  final double? percentChange7D;
  final int? marketCap;
  final DateTime? lastUpdated;

  Quote({
    this.price,
    this.volume24H,
    this.percentChange1H,
    this.percentChange24H,
    this.percentChange7D,
    this.marketCap,
    this.lastUpdated,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        price: json["price"]?.toDouble(),
        volume24H: json["volume_24h"],
        percentChange1H: json["percent_change_1h"]?.toDouble(),
        percentChange24H: json["percent_change_24h"]?.toDouble(),
        percentChange7D: json["percent_change_7d"]?.toDouble(),
        marketCap: json["market_cap"],
        lastUpdated: json["last_updated"] == null
            ? null
            : DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "volume_24h": volume24H,
        "percent_change_1h": percentChange1H,
        "percent_change_24h": percentChange24H,
        "percent_change_7d": percentChange7D,
        "market_cap": marketCap,
        "last_updated": lastUpdated?.toIso8601String(),
      };
}

class Status {
  final DateTime? timestamp;
  final int? errorCode;
  final dynamic errorMessage;
  final int? elapsed;
  final int? creditCount;
  final dynamic notice;

  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        elapsed: json["elapsed"],
        creditCount: json["credit_count"],
        notice: json["notice"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp?.toIso8601String(),
        "error_code": errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed,
        "credit_count": creditCount,
        "notice": notice,
      };
}
