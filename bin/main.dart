import 'package:firstapi/firstapi.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


/*Future main() async {
  final clientID = "com.mancera.local";
  final body = "username=Mancera&password=passroot&grant_type=password";

  final clientCredentials = Base64Encoder().convert("$clientID".codeUnits);

  print(clientCredentials.toString());
}*/

Future main() async {
  final app = Application<FirstapiChannel>()
      ..options.configurationFilePath = "config.yaml"
      ..options.port = 8888;

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");

  final clientID = "com.mancera.local";
  final body = "username=Mancera&password=passroot&grant_type=password";

  final clientCredentials = Base64Encoder().convert("$clientID".codeUnits);

  print(clientCredentials.toString());

  /*final response = await http.post(
    "https://localhost:8888/auth/token",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Basic $clientCredentials"
      },
      body: body);
  
  print(response.body.toString());*/
}