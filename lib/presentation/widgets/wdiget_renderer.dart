import 'package:flutter/material.dart';
import 'package:jdf/core/app_data_config_model.dart';

class WidgetRenderer extends StatelessWidget {
  final Component component;

  const WidgetRenderer({super.key, required this.component});

  @override
  Widget build(BuildContext context) {
    switch (component.type) {
      case "text":
        return Text(
          component.params?['content'] ?? '',
          style: TextStyle(
            fontSize: (component.params?['fontSize'] ?? 16).toDouble(),
            // color: _parseColor(component.params?['color']) ?? Colors.black,
          ),
        );
      case "centeredtext":
        return Center(
          child: Text(
            component.params?['content'] ?? '',
            style: TextStyle(
              fontSize: (component.params?['fontSize'] ?? 16).toDouble(),
              // color: _parseColor(component.params?['color']) ?? Colors.black,
            ),
          ),
        );

      case "image":
        return Image.network(
          component.params?['url'] ?? '',
          height: (component.params?['height'] ?? 100).toDouble(),
          width: (component.params?['width'] ?? 100).toDouble(),
          fit: BoxFit.cover,
        );

      case "button":
        return ElevatedButton(
          onPressed: () {
            // You could add navigation or callback handling here
            print('Button tapped: ${component.params?['action']}');
          },
          child: Text(component.params?['text'] ?? 'Click'),
        );

      case "list":
      default:
        return const SizedBox.shrink(); // fallback for unknown types
    }
  }

  // Color? _parseColor(String? colorStr) {
  //   if (colorStr == null) return null;
  //   try {
  //     return Color(int.parse(colorStr.replaceFirst('#', '0xff')));
  //   } catch (_) {
  //     return null;
  //   }
  // }
}
