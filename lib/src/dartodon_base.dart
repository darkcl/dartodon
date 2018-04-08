import 'models/client.dart' show DartodonClient;
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class Dartodon {
  static Future<DartodonClient> register(DartodonClient client, BaseClient httpClient) async{
    Uri uri = new Uri.https(client.baseUrl, '/api/v1/apps');
    Response response = 
      await httpClient.post(uri, headers: {"Content-Type": ContentType.JSON.toString()}, body: JSON.encode(client.toMap()), encoding: UTF8);
    Map jsonMap = JSON.decode(response.body);
    client.id = jsonMap['id'];
    client.clientId = jsonMap['client_id'];
    client.clientSecret = jsonMap['client_secret'];
    return new Future.value(client);
  }
}