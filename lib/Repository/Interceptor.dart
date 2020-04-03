import 'package:http_interceptor/http_interceptor.dart';

class Interceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print("================================================");
    print("================== REQUEST =====================");
    print(data.url);
    print(data.headers);
    print(data.body);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print("================================================");
    print("================= RESPONSE =====================");
    print(data.url);
    print(data.body);
    return data;
  }
}