import 'dart:convert';

import 'package:b13_flutter/shared/utils/universal_file/universal_file.dart';

class UserLocalStorage {
  static const kFileName = "user-storage";
  static const String tokenKey = 'token';

  load() async {
    String saveJson = await UniversalFile(kFileName).read();
    _fromJson(jsonDecode(saveJson) as Map<String, dynamic>);
  }
  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    _save();
  }

  void _save() {
    print("Saving: $kFileName");
    String saveJson = jsonEncode(_toJson());
    UniversalFile(kFileName).write(saveJson);
  }

  void _fromJson(Map<String, dynamic> json) {
    _token = json[tokenKey] ?? '';
  }

  Map<String, dynamic> _toJson() {
    return <String, dynamic>{
      tokenKey: _token,
    };
  }
}