class OrderModel {
  OrderModel({
    int? status,
    bool? success,
    List<Response>? response,
  }) {
    _status = status;
    _success = success;
    _response = response;
  }

  OrderModel.fromJson(dynamic json) {
    _status = json['status'];
    _success = json['success'];
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(Response.fromJson(v));
      });
    }
  }
  int? _status;
  bool? _success;
  List<Response>? _response;
  OrderModel copyWith({
    int? status,
    bool? success,
    List<Response>? response,
  }) =>
      OrderModel(
        status: status ?? _status,
        success: success ?? _success,
        response: response ?? _response,
      );
  int? get status => _status;
  bool? get success => _success;
  List<Response>? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['success'] = _success;
    if (_response != null) {
      map['response'] = _response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Response {
  Response({
    int? orderId,
    String? customer,
    String? bookingDate,
    String? installationDate,
    String? installationTime,
    int? technician,
  }) {
    _orderId = orderId;
    _customer = customer;
    _bookingDate = bookingDate;
    _installationDate = installationDate;
    _installationTime = installationTime;
    _technician = technician;
  }

  Response.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _customer = json['customer'];
    _bookingDate = json['booking_date'];
    _installationDate = json['installation_date'];
    _installationTime = json['installation_time'];
    _technician = json['technician'];
  }
  int? _orderId;
  String? _customer;
  String? _bookingDate;
  String? _installationDate;
  String? _installationTime;
  int? _technician;
  Response copyWith({
    int? orderId,
    String? customer,
    String? bookingDate,
    String? installationDate,
    String? installationTime,
    int? technician,
  }) =>
      Response(
        orderId: orderId ?? _orderId,
        customer: customer ?? _customer,
        bookingDate: bookingDate ?? _bookingDate,
        installationDate: installationDate ?? _installationDate,
        installationTime: installationTime ?? _installationTime,
        technician: technician ?? _technician,
      );
  int? get orderId => _orderId;
  String? get customer => _customer;
  String? get bookingDate => _bookingDate;
  String? get installationDate => _installationDate;
  String? get installationTime => _installationTime;
  int? get technician => _technician;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['customer'] = _customer;
    map['booking_date'] = _bookingDate;
    map['installation_date'] = _installationDate;
    map['installation_time'] = _installationTime;
    map['technician'] = _technician;
    return map;
  }
}
