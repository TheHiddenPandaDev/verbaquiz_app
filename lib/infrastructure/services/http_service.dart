import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:verbaquiz/domain/model/value_object/response.dart';
import 'package:verbaquiz/domain/services/http_service.dart';

@Injectable(as: HttpService)
class FlutterHttpService implements HttpService {
  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    final http.Response response = await http.get(url, headers: headers);

    return Response(
      statusCode: response.statusCode,
      body: response.body,
      headers: response.headers,
    );
  }
}
