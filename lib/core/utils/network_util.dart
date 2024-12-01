import 'dart:convert';

import 'package:al_karama_app/core/enums/request_type.dart';
import 'package:http/http.dart' as http;

class NetworkUtil {
  static String baseUrl = 'back.karama.darrebni.net';

  static Future sendRequest({
    required RequestType type,
    required String route,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    var url = Uri.https(baseUrl, route, params);

    http.Response response;
    try {
      switch (type) {
        case RequestType.POST:
          response = await http.post(url, body: body, headers: headers);
          break;
        case RequestType.GET:
          response = await http.get(url, headers: headers);
          break;
        case RequestType.DELETE:
          response =
              await http.delete(url, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.PUT:
          response =
              await http.put(url, body: jsonEncode(body), headers: headers);
          break;
      }
    } catch (e) {
      return {
        'response': {'error': e.toString()},
        'statusCode': 1
      };
    }

    Map<String, dynamic> jsonResponse = {};
    dynamic result;
    String decodedBody = Utf8Codec().decode(response.bodyBytes);

    try {
      result = jsonDecode(decodedBody);
    } catch (e) {}

    jsonResponse.putIfAbsent(
        'response', () => result ?? {'message': decodedBody});

    jsonResponse.putIfAbsent('statusCode', () => response.statusCode);

    return jsonResponse;
  }
}
