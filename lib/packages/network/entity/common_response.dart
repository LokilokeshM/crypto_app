class CommonResponse<T> {
  T? response;
  CommonError? error;

  CommonResponse({this.response, this.error});
}

class CommonError {
  int? errorCode;
  String? errorMessage;

  CommonError({this.errorCode, this.errorMessage});

  bool isHttpError() {
    switch (errorCode) {
      case NETWORK_ERROR:
      case REQUEST_TIMEOUT_ERROR:
      case HTTP_SERVER_ERROR:
        return true;
      default:
        return false;
    }
  }

  String get errorCodeString {
    switch (errorCode) {
      case NETWORK_ERROR:
        return "NETWORK_ERROR";
      case REQUEST_TIMEOUT_ERROR:
        return "REQUEST_TIMEOUT_ERROR";
      case HTTP_SERVER_ERROR:
        return "HTTP_SERVER_ERROR";
      case SERVER_ERROR:
        return "SERVER_ERROR";
      default:
        return "$errorCode";
    }
  }
}

const int NETWORK_ERROR = -1;

const int REQUEST_TIMEOUT_ERROR = -2;

const int SERVER_ERROR = -3;

const int HTTP_SERVER_ERROR = -4;
