class ApiData {
  bool? success;
  int? code;
  String? message;
  Data? data;

  ApiData({this.success, this.code, this.message, this.data});

  ApiData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Tags>? tags;

  Data({this.tags});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  String? sId;
  String? name;
  bool? active;

  Tags({this.sId, this.name, this.active});

  Tags.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['active'] = this.active;
    return data;
  }
}
