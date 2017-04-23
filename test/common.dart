library smartsheet.common;

import 'dart:io';
import 'dart:convert';
import 'dart:async';

final _oauth_token_key = "api_key";
final _email_key = "email";

class Config {
  String oauthToken;
  String email;
  Config(this.oauthToken, this.email);

  static Future<Config> readFromFile(String configFilePath) async {
    var file = new File(configFilePath);
    var dataAsString = await file.readAsString();
    var data = JSON.decode(dataAsString);

    return new Config(data[_oauth_token_key], data[_email_key]);
  }
}
