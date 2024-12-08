import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qiita/access_token/access_token_repository.dart';

class AccessTokenCubit extends Cubit<String?> {
  AccessTokenCubit() : super(null) {
    _read();
  }

  final _repository = const AccessTokenRepository();

  Future<void> delete() async {
    await _repository.delete();
    await _read();
  }

  Future<void> write({required String accessToken}) async {
    await _repository.write(accessToken: accessToken);
    await _read();
  }

  Future<void> _read() async {
    final accessToken = await _repository.read();
    emit(accessToken);
  }
}
