import 'package:stream_feed/stream_feed.dart';
import 'package:stream_feed_cli/stream_feed_cli.dart' as stream_feed_cli;

String? apiKey; // Set a hardcoded api key here to simply things
String? apiSecret; // Set a hardcoded api secret here to simply things
late StreamFeedClient serverClient;

void main(List<String> arguments) {
  stream_feed_cli.generate();
}
