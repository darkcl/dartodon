import 'package:dartodon/dartodon.dart';
import 'package:test/test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart';

import 'dart:convert';

void main() {
  group('Application Group', () {
    DartodonClient dartodonClient;

    MockClient client = new MockClient((request) async {
      return new Response("", 404);
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
