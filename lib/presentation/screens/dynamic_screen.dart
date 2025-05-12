import 'package:flutter/material.dart';
import 'package:jdf/components/screen_templates/BaseScreen.dart';
import 'package:jdf/components/screen_templates/ListingScreen.dart';
import 'package:jdf/components/screen_templates/FormScreen.dart'; // Import for form screen
import 'package:jdf/core/app_data_config_model.dart';

class DynamicScreen extends StatelessWidget {
  final Screen screenData;
  const DynamicScreen({super.key, required this.screenData});

  @override
  Widget build(BuildContext context) {
    Widget bodyContent;

    switch (screenData.type) {
      case "base":
        bodyContent = BaseScreen(screenData: screenData);
        break;
      case "listing":
        bodyContent = ListingScreen(screenData: screenData);
        break;
      case "form":
        bodyContent = FormScreen(screenData: screenData); // Handle form screen
        break;
      default:
        bodyContent = Center(child: Text("Unknown screen type"));
    }

    return bodyContent;
  }
}
