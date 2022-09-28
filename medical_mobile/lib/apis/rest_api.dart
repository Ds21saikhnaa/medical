import 'package:medical_mobile/apis/rest_api_client.dart';

class RestApi {
  static final RestApi _singleton = RestApi._internal();

  factory RestApi() => _singleton;

  RestApi._internal();

  final RestApiClient _restApiClient = RestApiClient();

  /// Auth Api
  Future<MedicalResponse> login(dynamic body) async {
    return _restApiClient.sendRequest('login', Method.post, body: body);
  }

  Future<MedicalResponse> signUp(dynamic body) async {
    return _restApiClient.sendRequest('register', Method.post, body: body);
  }

  /// User Api
  Future<MedicalResponse> userMe() async {
    return _restApiClient.sendRequest('user/me', Method.get);
  }

  /// Device Api
  Future<MedicalResponse> getDevice() async {
    return _restApiClient.sendRequest('device', Method.get);
  }

  Future<MedicalResponse> getDeviceUserHome() async {
    return _restApiClient.sendRequest('device/user_home', Method.get);
  }

  Future<MedicalResponse> getProductCategory() async {
    return _restApiClient.sendRequest('product/category', Method.get);
  }

  Future<MedicalResponse> getProductList({required String product}) async {
    return _restApiClient.sendRequest('$product/list', Method.get);
  }

  Future<MedicalResponse> getProductDetails({
    required String product,
    required String serialNumber,
  }) async {
    return _restApiClient.sendRequest(
        '$product/detail?serial_number=$serialNumber', Method.get);
  }
}
