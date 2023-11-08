// To parse this JSON data, do
//
//     final getDetails = getDetailsFromJson(jsonString);

import 'dart:convert';

GetDetails getDetailsFromJson(String str) =>
    GetDetails.fromJson(json.decode(str));

String getDetailsToJson(GetDetails data) => json.encode(data.toJson());

class GetDetails {
  final Status? status;
  final Map<String, dynamic>? data;

  GetDetails({
    this.status,
    this.data,
  });

  factory GetDetails.fromJson(Map<String, dynamic> json) => GetDetails(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "data": data,
      };
}

class Data {
  final int? id;
  final String? name;
  final String? symbol;
  final String? category;
  final String? description;
  final String? slug;
  final String? logo;
  final String? subreddit;
  final String? notice;
  final List<String>? tags;
  final List<String>? tagNames;
  final List<String>? tagGroups;
  final Urls? urls;
  final CoinClass? platform;
  final DateTime? dateAdded;
  final String? twitterUsername;
  final int? isHidden;
  final DateTime? dateLaunched;
  final List<ContractAddress>? contractAddress;
  final int? selfReportedCirculatingSupply;
  final dynamic selfReportedTags;
  final dynamic selfReportedMarketCap;
  final bool? infiniteSupply;

  Data({
    this.id,
    this.name,
    this.symbol,
    this.category,
    this.description,
    this.slug,
    this.logo,
    this.subreddit,
    this.notice,
    this.tags,
    this.tagNames,
    this.tagGroups,
    this.urls,
    this.platform,
    this.dateAdded,
    this.twitterUsername,
    this.isHidden,
    this.dateLaunched,
    this.contractAddress,
    this.selfReportedCirculatingSupply,
    this.selfReportedTags,
    this.selfReportedMarketCap,
    this.infiniteSupply,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        category: json["category"],
        description: json["description"],
        slug: json["slug"],
        logo: json["logo"],
        subreddit: json["subreddit"],
        notice: json["notice"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        tagNames: json["tag-names"] == null
            ? []
            : List<String>.from(json["tag-names"]!.map((x) => x)),
        tagGroups: json["tag-groups"] == null
            ? []
            : List<String>.from(json["tag-groups"]!.map((x) => x)),
        urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
        platform: json["platform"] == null
            ? null
            : CoinClass.fromJson(json["platform"]),
        dateAdded: json["date_added"] == null
            ? null
            : DateTime.parse(json["date_added"]),
        twitterUsername: json["twitter_username"],
        isHidden: json["is_hidden"],
        dateLaunched: json["date_launched"] == null
            ? null
            : DateTime.parse(json["date_launched"]),
        contractAddress: json["contract_address"] == null
            ? []
            : List<ContractAddress>.from(json["contract_address"]!
                .map((x) => ContractAddress.fromJson(x))),
        selfReportedCirculatingSupply: json["self_reported_circulating_supply"],
        selfReportedTags: json["self_reported_tags"],
        selfReportedMarketCap: json["self_reported_market_cap"],
        infiniteSupply: json["infinite_supply"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "category": category,
        "description": description,
        "slug": slug,
        "logo": logo,
        "subreddit": subreddit,
        "notice": notice,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "tag-names":
            tagNames == null ? [] : List<dynamic>.from(tagNames!.map((x) => x)),
        "tag-groups": tagGroups == null
            ? []
            : List<dynamic>.from(tagGroups!.map((x) => x)),
        "urls": urls?.toJson(),
        "platform": platform?.toJson(),
        "date_added": dateAdded?.toIso8601String(),
        "twitter_username": twitterUsername,
        "is_hidden": isHidden,
        "date_launched": dateLaunched?.toIso8601String(),
        "contract_address": contractAddress == null
            ? []
            : List<dynamic>.from(contractAddress!.map((x) => x.toJson())),
        "self_reported_circulating_supply": selfReportedCirculatingSupply,
        "self_reported_tags": selfReportedTags,
        "self_reported_market_cap": selfReportedMarketCap,
        "infinite_supply": infiniteSupply,
      };
}

class ContractAddress {
  final String? contractAddress;
  final ContractAddressPlatform? platform;

  ContractAddress({
    this.contractAddress,
    this.platform,
  });

  factory ContractAddress.fromJson(Map<String, dynamic> json) =>
      ContractAddress(
        contractAddress: json["contract_address"],
        platform: json["platform"] == null
            ? null
            : ContractAddressPlatform.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "contract_address": contractAddress,
        "platform": platform?.toJson(),
      };
}

class ContractAddressPlatform {
  final String? name;
  final CoinClass? coin;

  ContractAddressPlatform({
    this.name,
    this.coin,
  });

  factory ContractAddressPlatform.fromJson(Map<String, dynamic> json) =>
      ContractAddressPlatform(
        name: json["name"],
        coin: json["coin"] == null ? null : CoinClass.fromJson(json["coin"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "coin": coin?.toJson(),
      };
}

class CoinClass {
  final String? id;
  final String? name;
  final String? symbol;
  final String? slug;
  final String? tokenAddress;

  CoinClass({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.tokenAddress,
  });

  factory CoinClass.fromJson(Map<String, dynamic> json) => CoinClass(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        tokenAddress: json["token_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "token_address": tokenAddress,
      };
}

class Urls {
  final List<String>? website;
  final List<String>? twitter;
  final List<dynamic>? messageBoard;
  final List<String>? chat;
  final List<dynamic>? facebook;
  final List<String>? explorer;
  final List<dynamic>? reddit;
  final List<String>? technicalDoc;
  final List<String>? sourceCode;
  final List<dynamic>? announcement;

  Urls({
    this.website,
    this.twitter,
    this.messageBoard,
    this.chat,
    this.facebook,
    this.explorer,
    this.reddit,
    this.technicalDoc,
    this.sourceCode,
    this.announcement,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        website: json["website"] == null
            ? []
            : List<String>.from(json["website"]!.map((x) => x)),
        twitter: json["twitter"] == null
            ? []
            : List<String>.from(json["twitter"]!.map((x) => x)),
        messageBoard: json["message_board"] == null
            ? []
            : List<dynamic>.from(json["message_board"]!.map((x) => x)),
        chat: json["chat"] == null
            ? []
            : List<String>.from(json["chat"]!.map((x) => x)),
        facebook: json["facebook"] == null
            ? []
            : List<dynamic>.from(json["facebook"]!.map((x) => x)),
        explorer: json["explorer"] == null
            ? []
            : List<String>.from(json["explorer"]!.map((x) => x)),
        reddit: json["reddit"] == null
            ? []
            : List<dynamic>.from(json["reddit"]!.map((x) => x)),
        technicalDoc: json["technical_doc"] == null
            ? []
            : List<String>.from(json["technical_doc"]!.map((x) => x)),
        sourceCode: json["source_code"] == null
            ? []
            : List<String>.from(json["source_code"]!.map((x) => x)),
        announcement: json["announcement"] == null
            ? []
            : List<dynamic>.from(json["announcement"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "website":
            website == null ? [] : List<dynamic>.from(website!.map((x) => x)),
        "twitter":
            twitter == null ? [] : List<dynamic>.from(twitter!.map((x) => x)),
        "message_board": messageBoard == null
            ? []
            : List<dynamic>.from(messageBoard!.map((x) => x)),
        "chat": chat == null ? [] : List<dynamic>.from(chat!.map((x) => x)),
        "facebook":
            facebook == null ? [] : List<dynamic>.from(facebook!.map((x) => x)),
        "explorer":
            explorer == null ? [] : List<dynamic>.from(explorer!.map((x) => x)),
        "reddit":
            reddit == null ? [] : List<dynamic>.from(reddit!.map((x) => x)),
        "technical_doc": technicalDoc == null
            ? []
            : List<dynamic>.from(technicalDoc!.map((x) => x)),
        "source_code": sourceCode == null
            ? []
            : List<dynamic>.from(sourceCode!.map((x) => x)),
        "announcement": announcement == null
            ? []
            : List<dynamic>.from(announcement!.map((x) => x)),
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
