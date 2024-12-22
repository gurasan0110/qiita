import 'package:flutter_dotenv/flutter_dotenv.dart';

class Client {
  const Client._();

  static final id = dotenv.get('CLIENT_ID');
  static final secret = dotenv.get('CLIENT_SECRET');
}
