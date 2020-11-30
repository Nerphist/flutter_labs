import 'package:http/http.dart' as http;
import 'dart:convert';

Future<int> getLatestConfirmed() async {
  final response =
      await http.get('https://coronavirus-tracker-api.herokuapp.com/v2/latest');

  return jsonDecode(response.body)['latest']['confirmed'];
}

Future<int> getLatestDead() {
  return http
      .get('https://coronavirus-tracker-api.herokuapp.com/v2/latest')
      .then((value) => jsonDecode(value.body)['latest']['deaths']);
}
