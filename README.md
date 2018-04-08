# dartodon

A dart library for mastodon api.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

Register Application

```dart
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
```
