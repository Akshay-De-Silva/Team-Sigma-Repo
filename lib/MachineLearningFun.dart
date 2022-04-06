import 'package:http/http.dart' as http;

Future<http.Response> createAlbum(String title) async {

  return await http.post(
    Uri.parse('https://clara-vita.herokuapp.com/trainingModel'),
    headers: {"Content-Type": "application/json"},
    body: title,
  );

}