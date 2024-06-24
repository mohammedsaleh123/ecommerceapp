import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpAuth {
  login(
      String uri, Map<String, String> headers, Map<String, String> body) async {
    try {
      final request = await http.post(Uri.parse(uri),
          headers: headers, body: jsonEncode(body));
      //print(jsonDecode(request.body));

      return request;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  getUser() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/auth/me'));
    final data = jsonDecode(response.body);
    return data;
  }
}
