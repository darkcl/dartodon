import 'package:dartodon/dartodon.dart';
import 'package:test/test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart';

import 'dart:convert';
import 'dart:io';

void main() {
  group('Application Group', () {
    DartodonClient dartodonClient;

    MockClient client = new MockClient((request) async {
      if (request.url.toString() == "https://mastodon.social/api/v1/apps") {
        String path = "test/fixture/apps.json";
        File file = new File(path);
        String appsFixture = await file.readAsStringSync();
        return new Response(appsFixture, 200);
      }else{
        return new Response("", 404);
      }
    });

    setUp(() {
      dartodonClient = new DartodonClient();
    });

    test('First Test', () async {
      DartodonClient registeredClient = await Dartodon.register(dartodonClient, client);

      expect(registeredClient.clientId, isNotEmpty);
      expect(registeredClient.isRegistered, isTrue);
    });
  });
}
