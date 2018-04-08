import 'package:dartodon/dartodon.dart';
import 'package:test/test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart';
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

    test('Register Client Tests', () async {
      DartodonClient registeredClient = await Dartodon.register(dartodonClient, client);

      expect(registeredClient.clientId, "a606f90e615de04fc9e50cc83aa924a703ea675d206d5a9c1ca51f8aef45df4a");
      expect(registeredClient.clientSecret, "8b922babbd4e2f568d49326f6a720def3384d6707ddc7216489874ca8dd557b6");
      expect(registeredClient.id, "191815");
      expect(registeredClient.isRegistered, isTrue);
    });
  });
}
