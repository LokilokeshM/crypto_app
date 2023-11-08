const Duration timeout = Duration(milliseconds: 60 * 1000);

const String baseUrl = "https://sandbox-api.coinmarketcap.com/";
const String logoUrl = "https://pro-api.coinmarketcap.com/";
const String key = "b4d6d14c-7e08-4c85-975b-e13bb683d232";

enum APIFlavor { dev, qa, stage, stageBlue, prod }

String apiFlavorString(APIFlavor value) {
  return value.toString().split('.').last;
}
