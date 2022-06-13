import 'dart:convert';
import 'dart:io';

import 'package:stream_feed/stream_feed.dart';

late StreamFeedClient serverClient;

String? apiKey; // Set a hardcoded api key here
String? apiSecret; // Set a hardcoded api secret here

void generate() {
  _readApiKey();

  _readApiSecret();

  print('\nCreating server client...\n');
  serverClient = StreamFeedClient(
    apiKey!,
    secret: apiSecret,
    runner: Runner.server,
  );

  print('\nPress cntr-c to terminate.\n');
  _readAndGenerateUserTokens();
}

void _readApiKey() {
  if (apiKey == null) {
    print('\nEnter your Stream Feed App API KEY:');
    apiKey = stdin.readLineSync(encoding: utf8)?.trim();
    _ifEmptyExit(apiKey);
  }
}

void _readApiSecret() {
  if (apiSecret == null) {
    print('\nEnter your Stream Feed App API SECRET:');
    apiSecret = stdin.readLineSync(encoding: utf8)?.trim();
    _ifEmptyExit(apiSecret);
  }
}

void _readAndGenerateUserTokens() {
  while (true) {
    print('\nGenerate token for user with username:');
    final username = stdin.readLineSync(encoding: utf8)?.trim();
    _ifEmptyExit(username);
    final token = serverClient.frontendToken(
      username!,
      expiresAt: DateTime.now().add(Duration(days: 120)),
    );
    print('\nToken generated for $username:  $token\n');
  }
}

void _ifEmptyExit(String? value) {
  if (value?.isEmpty ?? true) {
    print('\nThis cannot be empty. Terminating\n');
    exit(0);
  }
}
