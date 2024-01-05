import 'package:kite_mobility/services/network_api_service.dart';
import 'package:kite_mobility/util/app_url.dart';

class SignInRepository {
  final _apiService = NetworkApiService();

  Future<dynamic> signInApi(var data) async {
    dynamic response = _apiService.postApi(AppUrl.loginApi, data);
    return response;
  }
}
