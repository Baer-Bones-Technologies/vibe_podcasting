import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

import '../strings.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Config{
  const Config({
    required this.android,
    required this.ios,
    required this.macos,
    required this.web,
  });

  final FirebaseOptions android;
  final FirebaseOptions ios;
  final FirebaseOptions macos;
  final FirebaseOptions web;

  factory Config.fromJson(
    Map<String, dynamic> json,
      ){
    return Config(
      android: FirebaseOptions(
        apiKey: json['android']['apiKey'],
        appId: json['android']['appId'],
        messagingSenderId: json['android']['messagingSenderId'],
        projectId: json['android']['projectId'],
        storageBucket: json['android']['storageBucket'],
      ),
      ios: FirebaseOptions(
        apiKey: json['ios']['apiKey'],
        appId: json['ios']['appId'],
        messagingSenderId: json['ios']['messagingSenderId'],
        projectId: json['ios']['projectId'],
        storageBucket: json['ios']['storageBucket'],
        iosBundleId: json['ios']['iosBundleId'],
      ),
      macos: FirebaseOptions(
        apiKey: json['macos']['apiKey'],
        appId: json['macos']['appId'],
        messagingSenderId: json['macos']['messagingSenderId'],
        projectId: json['macos']['projectId'],
        storageBucket: json['macos']['storageBucket'],
      ),
      web: FirebaseOptions(
        apiKey: json['web']['apiKey'],
        appId: json['web']['appId'],
        messagingSenderId: json['web']['messagingSenderId'],
        projectId: json['web']['projectId'],
        storageBucket: json['web']['storageBucket'],
      ),
    );
  }

  static fromEnvironment() {
    try{
    const configText = String.fromEnvironment(CONFIG, defaultValue: '');
    debugPrint('fullString: $configText');
    if(configText.isEmpty){
      throw PlatformException(
        code: 'CONFIG_ERROR',
        message: 'No config found in environment',
      );
    }
    final json = jsonEncode(configText);
    debugPrint('json: $json');
    final Map<String, dynamic> jsonMap = jsonDecode(json);

    return Config.fromJson(jsonMap);
  } on FormatException catch(e){
      throw PlatformException(
        code: 'CONFIG_ERROR',
        message: 'Error parsing config: $e',
      );
    }
  }
}