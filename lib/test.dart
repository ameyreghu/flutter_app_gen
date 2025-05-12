import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jdf/core/app_data_config_model.dart';
import 'package:jdf/mock/mock_config.dart';
import 'package:jdf/mock/ms.dart';

void main() {
  var res = AppDataConfigModel.fromJson(mock_appDataConfig);

  print(res.toJson());
}
