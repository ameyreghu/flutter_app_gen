import 'package:flutter/material.dart';
import 'package:jdf/core/app_data_config_model.dart';
import 'package:jdf/custom_app.dart';
import 'package:jdf/mock/mock_config.dart';
import 'package:jdf/mock/ms.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({super.key});

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  bool isLoading = true;
  AppDataConfigModel? appDataConfigModel;

  //TOD:  load app config and render app

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
        appDataConfigModel = AppDataConfigModel.fromJson(mock_appDataConfig);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? showRootLoading() : CustomApp(appDataConfigModel: appDataConfigModel!,);
  }
}

Widget showRootLoading() {
  return Material(
    child: const Center(child: CircularProgressIndicator.adaptive()),
  );
}
