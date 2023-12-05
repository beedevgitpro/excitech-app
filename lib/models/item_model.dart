import 'package:get/get.dart';

class ItemModel {
  ItemModel({
    int? status,
    bool? success,
    List<Response>? response,
  }) {
    _status = status;
    _success = success;
    _response = response;
  }

  ItemModel.fromJson(dynamic json) {
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
  ItemModel copyWith({
    int? status,
    bool? success,
    List<Response>? response,
  }) =>
      ItemModel(
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
    int? orderItemId,
    String? product,
    String? bookingDate,
    String? latitude,
    String? longitude,
    String? installationDate,
    String? comment,
    String? viewByTechnician,
    RxBool? isStart,
    RxBool? startInstalltion,
    String? installationComplete,
    String? sku,
    String? customer,
    String? country,
    String? state,
    String? street,
    String? city,
    String? phone,
    String? email,
  }) {
    _orderItemId = orderItemId;
    _product = product;
    _bookingDate = bookingDate;
    _latitude = latitude;
    _longitude = longitude;
    _installationDate = installationDate;
    _comment = comment;
    _viewByTechnician = viewByTechnician;
    _isStart = isStart;
    _startInstalltion = startInstalltion;
    _installationComplete = installationComplete;
    _sku = sku;
    _customer = customer;
    _country = country;
    _state = state;
    _street = street;
    _city = city;
    _phone = phone;
    _email = email;
  }

  Response.fromJson(dynamic json) {
    _orderItemId = json['order_item_id'];
    _product = json['product'];
    _bookingDate = json['booking_date'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _installationDate = json['installation_date'];
    _comment = json['comment'];
    _viewByTechnician = json['view_by_technician'];
    _installationComplete = json['installation_complete'];
    _sku = json['sku'];
    _customer = json['customer'];
    _country = json['country'];
    _state = json['state'];
    _street = json['street'];
    _city = json['city'];
    _phone = json['phone1'];
    _email = json['email'];
  }
  int? _orderItemId;
  String? _product;
  String? _bookingDate;
  String? _latitude;
  String? _longitude;
  String? _installationDate;
  String? _comment;
  String? _viewByTechnician;
  String? _installationComplete;
  RxBool? _isStart = false.obs;
  RxBool? _startInstalltion = false.obs;
  String? _sku;
  String? _customer;
  String? _country;
  String? _state;
  String? _street;
  String? _city;
  String? _phone;
  String? _email;
  Response copyWith({
    int? orderItemId,
    String? product,
    String? bookingDate,
    String? latitude,
    String? longitude,
    String? installationDate,
    String? comment,
    String? viewByTechnician,
    String? installationComplete,
    String? sku,
    String? customer,
    String? country,
    String? state,
    String? street,
    String? city,
    String? phone,
    String? email,
  }) =>
      Response(
        orderItemId: orderItemId ?? _orderItemId,
        product: product ?? _product,
        bookingDate: bookingDate ?? _bookingDate,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        installationDate: installationDate ?? _installationDate,
        comment: comment ?? _comment,
        viewByTechnician: viewByTechnician ?? _viewByTechnician,
        installationComplete: installationComplete ?? _installationComplete,
        isStart: isStart ?? false.obs,
        startInstalltion: startInstalltion ?? false.obs,
        sku: sku ?? _sku,
        customer: customer ?? _customer,
        country: country ?? _country,
        state: state ?? _state,
        city: city ?? _city,
        phone: phone ?? _phone,
        email: email ?? _email,
      );
  int? get orderItemId => _orderItemId;
  String? get product => _product;
  String? get bookingDate => _bookingDate;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get installationDate => _installationDate;
  String? get comment => _comment;
  String? get viewByTechnician => _viewByTechnician;
  String? get installationComplete => _installationComplete;
  RxBool? get isStart => _isStart;
  RxBool? get startInstalltion => _startInstalltion;
  String? get sku => _sku;
  String? get customer => _customer;
  String? get country => _country;
  String? get state => _state;
  String? get street => _street;
  String? get city => _city;
  String? get phone => _phone;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_item_id'] = _orderItemId;
    map['product'] = _product;
    map['booking_date'] = _bookingDate;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['installation_date'] = _installationDate;
    map['comment'] = _comment;
    map['view_by_technician'] = _viewByTechnician;
    map['sku'] = _sku;
    map['customer'] = _customer;
    map['country'] = _country;
    map['state'] = _state;
    map['street'] = _street;
    map['city'] = _city;
    map['phone1'] = _phone;
    map['email'] = _email;
    return map;
  }
}
