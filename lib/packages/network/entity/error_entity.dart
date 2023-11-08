class ErrorEntity {
  String? status;
  int? statusCode;
  StatusEntity? statusEntity;
  String? code;
  String? message;
  List<ErrorError>? errors;
  bool? success;
  ErrorError? error;
  String? errorDescription;

  ErrorEntity(
      {this.status,
      this.statusCode,
      this.statusEntity,
      this.code,
      this.message,
      this.errors,
      this.success,
      this.error,
      this.errorDescription});

  ErrorEntity.fromJson(dynamic json) {
    if (json["status"] is String) {
      status = json["status"];
    } else if (json["status"] is int) {
      statusCode = json["status"];
    } else {
      statusEntity =
          json["status"] != null ? StatusEntity.fromJson(json["status"]) : null;
    }
    code = json["code"].toString();
    message = json["message"];
    if (json["errors"] != null) {
      errors = [];
      json["errors"].forEach((v) {
        errors!.add(ErrorError.fromJson(v));
      });
    }
    success = json["success"];
    if (json["error"] != null && json["error"] is String) {
      errorDescription = json["error"];
    } else {
      error = json["error"] != null ? ErrorError.fromJson(json["error"]) : null;
    }
  }
}

class ErrorResponse {
  StatusEntity? status;

  ErrorResponse({this.status});

  ErrorResponse.fromJson(dynamic json) {
    status =
        json["status"] != null ? StatusEntity.fromJson(json["status"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (status != null) {
      map["status"] = status!.toJson();
    }
    return map;
  }
}

class ErrorError {
  String? code;
  String? severity;
  String? message;

  ErrorError({this.code, this.severity, this.message});

  ErrorError.fromJson(dynamic json) {
    severity = json["severity"];
    code = json["code"].toString();
    message = json["message"];
  }
}

class StatusEntity {
  List<Messages> messages;

  StatusEntity({required this.messages});

  factory StatusEntity.fromJson(dynamic json) {
    final messages = <Messages>[];
    json["messages"].forEach((v) {
      messages.add(Messages.fromJson(v));
    });
    return StatusEntity(messages: messages);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["messages"] = messages.map((v) => v.toJson()).toList();
    return map;
  }
}

class Messages {
  String responseCode;
  String description;
  String? detailedDescription;

  Messages({
    required this.responseCode,
    required this.description,
    String? detailedDescription,
  });

  Messages.fromJson(dynamic json)
      : responseCode = json["responseCode"],
        description = json["description"],
        detailedDescription = json["detailedDescription"];

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["responseCode"] = responseCode;
    map["description"] = description;
    map["detailedDescription"] = detailedDescription;
    return map;
  }
}
