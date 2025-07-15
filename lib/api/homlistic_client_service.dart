import "dart:async";
import 'package:chopper/chopper.dart';

// This is necessary for the generator to work.
part "homlistic_client_service.chopper.dart";

@ChopperApi()
abstract class HomlisticClientService extends ChopperService {

  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static HomlisticClientService create(String baseUrl) {
    final client = ChopperClient(
        baseUrl: Uri.parse(baseUrl),
        services: [
          _$HomlisticClientService(),
        ],
    );

    return _$HomlisticClientService(client);
  }

  @POST(path: '/email/contact')
  Future<Response<String>> sendContact(
      @Query("subject") String subject,
      @Query("body") String body,
      @Query("verify-key") String verifyKey);
}