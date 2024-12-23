import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:qiita/data/http_client.dart';
import 'package:qiita/utils/constants/client.dart';
import 'package:uuid/uuid.dart';

class AuthService {
  const AuthService();

  Future<String> authorize() async {
    final scope = 'read_qiita write_qiita';
    final requestState = const Uuid().v4();
    final endpoint = '${HttpClient().options.baseUrl}/oauth/authorize';
    final urlString = await FlutterWebAuth2.authenticate(
      url: '$endpoint?client_id=${Client.id}&scope=$scope&state=$requestState',
      callbackUrlScheme: 'qiita',
    );
    final url = Uri.parse(urlString);

    final responseState = url.queryParameters['state'];
    if (requestState != responseState) {
      throw Exception('requestState != responseState');
    }

    final code = url.queryParameters['code'];
    if (code == null) {
      throw Exception('code == null');
    }

    return code;
  }
}
