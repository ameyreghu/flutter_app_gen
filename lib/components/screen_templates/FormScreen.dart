import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdf/components/widgets/DashboardCard.dart';
import 'package:jdf/components/widgets/carousel.dart';
import 'package:jdf/components/widgets/materail_icon.dart';
import 'package:jdf/core/app_data_config_model.dart';
import 'package:jdf/mock/mock_config.dart';
import 'package:jdf/presentation/widgets/wdiget_renderer.dart'; // Import WidgetRenderer

class FormScreen extends StatefulWidget {
  final Screen screenData;
  const FormScreen({super.key, required this.screenData});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  Map<String, dynamic> state = {};

  @override
  void initState() {
    super.initState();
    state = {...widget.screenData.initialState};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.screenData.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20.h,
          children:
              widget.screenData.components.map((component) {
                return loaclRenderer(component: component);
              }).toList(),
        ),
      ),
    );
  }

  Widget loaclRenderer({required Component component}) {
    // print(component.type);
    // print(component.params);
    print(state);

    switch (component.type) {
      case "input":
        return TextFormField(
          decoration: InputDecoration(
            labelText: component.params['label'] ?? '',
            hintText: component.params['hint'] ?? '',
          ),
          onChanged: (value) {
            setState(() {
              state["formData"][component.params['dataKey']] = value;
            });
          },
        );
      case "button":
        return ElevatedButton(
          onPressed: () {
            // Handle button press
            print("Button pressed with data: ${state["formData"]}");
            showSubmissionDialog(context, state["formData"].toString());
          },
          child: Text(component.params['label'] ?? 'Button'),
        );
      case "dropdown":
        return DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: component.params['label'] ?? '',
          ),
          items: (component.params['options'] as List)
              .map((option) => DropdownMenuItem(
                    value: option['value'],
                    child: Text(option['label']),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              state["formData"][component.params['dataKey']] = value;
            });
          },
        );
      case "checkbox":
        return CheckboxListTile(
          title: Text(component.params['label'] ?? ''),
          value: state[component.params['dataKey']] ?? false,
          onChanged: (value) {
            setState(() {
              state[component.params['dataKey']] = value;
            });
          },
        );
      default:
        return WidgetRenderer(
          component: component,
        ); // Fallback to WidgetRenderer for other types
    }
  }
}

showSubmissionDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Form Submitted Successfully"),
        content: Text("data: $message"),

        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
