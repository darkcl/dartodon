import '../service/apps_service.dart';

class DartodonClient {
  bool isRegistered = false;
  bool isHttps = true;
  String baseUrl = "mastodon.social";

  String clientName = "Dartodon";
  String redirectUris = "urn:ietf:wg:oauth:2.0:oob";
  List<String> scopes = ["read", "write", "follow"];
  String website = "https://github.com/darkcl/dartodon";

  String id = "";
  String clientId = "";
  String clientSecret = "";

  Map toMap() {
    return {
      'client_name': clientName,
      'redirect_uris': redirectUris,
      'scopes': scopes.join(" ")
    };
  }
}