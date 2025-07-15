import 'package:get/get.dart';

import 'api/homlistic_client_service.dart';

class ControllerDataBindings implements Bindings {

  final String _baseUrl;
  final String  _cdnBaseUrl;
  ControllerDataBindings(this._baseUrl, this._cdnBaseUrl);

  @override
  void dependencies() {
    Get.put(HomlisticClientService.create(_baseUrl), permanent: true);
  }

}