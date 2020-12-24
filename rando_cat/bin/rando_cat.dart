import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  sendRequest();
}

Future<void> sendRequest() async {
  var response = await http.get('https://jsonplaceholder.typicode.com/todos/1');
  print(response.body);
}
