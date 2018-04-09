
/// Dartodon Client
/// 
/// Manage mastodon api oauth2 client id, secret and application specific information.
class DartodonClient {
  bool get isRegistered => (id.isNotEmpty && clientId.isNotEmpty && clientSecret.isNotEmpty);
  bool isHttps = true;
  String baseUrl = "mastodon.social";

  String clientName = "Dartodon";
  String redirectUris = "urn:ietf:wg:oauth:2.0:oob";
  List<String> scopes = ["read", "write", "follow"];
  String website = "https://github.com/darkcl/dartodon";

  String id = "";
  String clientId = "";
  String clientSecret = "";

  Uri get registerEndpoint => this.isHttps ? new Uri.https(this.baseUrl, '/api/v1/apps') : new Uri.http(this.baseUrl, '/api/v1/apps');

  Map toMap() {
    return {
      'client_name': clientName,
      'redirect_uris': redirectUris,
      'scopes': scopes.join(" ")
    };
  }
}