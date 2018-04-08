import 'package:dartodon/dartodon.dart';
import 'package:http/http.dart';

main() async{
  DartodonClient client = new DartodonClient();
  client.isHttps = true;
  client.baseUrl = "mastodon.social";
  client.redirectUris = "myapp://success";
  client.clientName = "Awesome Client";

  client = await Dartodon.register(client, new IOClient());
}
