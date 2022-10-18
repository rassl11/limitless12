import 'package:dio/dio.dart';
import 'package:users_creators/src/features/login/repo/login_repo.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final authData = LoginRepo().getAuthData();
    options.headers['Authorization'] = '${authData?.tokenType} ${authData?.accessToken}';
    // print('AccesssToken: ${authData?.accessToken}');
    handler.next(options);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    final loginRepo = LoginRepo();
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      final authData = await loginRepo.refreshToken();
      if (authData == null) {
        return super.onError(err, handler);
      }

      err.requestOptions.headers['Authorization'] = 'Bearer ${authData.accessToken}';

      final opts = Options(method: err.requestOptions.method, headers: err.requestOptions.headers);
      final cloneReq = await Dio().request(err.requestOptions.path,
          options: opts,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters);
      return handler.resolve(cloneReq);
    }
  }
}
