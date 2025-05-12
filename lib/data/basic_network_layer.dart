import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jdf/core/result.dart';

Future<Result<dynamic, Error>> getData({required String url}) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    //  print(response.body);
    return Success(jsonDecode(response.body));
  } else {
    //print(response.body);
    return Failed(Error());
  }
}
