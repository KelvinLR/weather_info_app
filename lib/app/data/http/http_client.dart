import 'package:http/http.dart' as http;

abstract class HttpClientInterface {
  Future get({required String url});
}

class HttpClient implements HttpClientInterface {
  final client = http.Client();

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }
}
