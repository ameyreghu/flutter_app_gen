// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppDataConfigModel {
  final String appName;
  final String appVersion;
  final String intialRoute;
  final List<String> routes;
  final ThemeConfig themeConfig;
  final List<Screen> screens;
  AppDataConfigModel({
    required this.appName,
    required this.appVersion,
    required this.themeConfig,
    required this.intialRoute,
    required this.routes,
    required this.screens,
  });

  factory AppDataConfigModel.fromJson(Map<String, dynamic> json) {
    return AppDataConfigModel(
      appName: json['appName'],
      appVersion: json['appVersion'],
      themeConfig: ThemeConfig.fromJson(json['themeConfig']),
      intialRoute: json['intialRoute'],
      routes: List<String>.from(json['routes']),
      screens:
          (json['screens'] as List).map((e) => Screen.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appName': appName,
      'appVersion': appVersion,
      'themeConfig': themeConfig.toJson(),
      'intialRoute': intialRoute,
      'routes': routes,
      'screens': screens.map((e) => e.toJson()).toList(),
    };
  }
}

class ThemeConfig {
  final String primaryColor;
  final String secondaryColor;
  final String backgroundColor;
  final String textColor;
  final bool isDarkMode;
  final Map<String, String>? darkTheme; // Added darkTheme property

  ThemeConfig({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.textColor,
    required this.isDarkMode,
    this.darkTheme, // Initialize darkTheme
  });

  factory ThemeConfig.fromJson(Map<String, dynamic> json) {
    return ThemeConfig(
      primaryColor: json['primaryColor'],
      secondaryColor: json['secondaryColor'],
      backgroundColor: json['backgroundColor'],
      textColor: json['textColor'],
      isDarkMode: json['isDarkMode'],
      darkTheme:
          json['darkTheme'] != null
              ? Map<String, String>.from(json['darkTheme'])
              : null, // Parse darkTheme if available
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'primaryColor': primaryColor,
      'secondaryColor': secondaryColor,
      'backgroundColor': backgroundColor,
      'textColor': textColor,
      'isDarkMode': isDarkMode,
      if (darkTheme != null)
        'darkTheme': darkTheme, // Include darkTheme if available
    };
  }
}

class Screen {
  final String title;
  final String key;
  final String routeName;
  final String type;
  final Map<String, dynamic> initialState;
  final Map<String, String> intialAction;
  List<Component> components = [];
  final DraweConfig? drawerConfig;
  Screen({
    required this.title,
    required this.key,
    required this.routeName,
    required this.type,
    required this.components,
    this.initialState = const {},
    this.intialAction = const {},
    this.drawerConfig,
  });

  factory Screen.fromJson(Map<String, dynamic> json) {
    return Screen(
      title: json['title'],
      key: json['key'],
      routeName: json['routeName'],
      type: json['type'],
      components:
          (json['components'] as List)
              .map((e) => Component.fromJson(e))
              .toList(),
      initialState: json['initialState'] ?? {},
      intialAction: Map<String, String>.from(json['intialAction'] ?? {}),
      drawerConfig:
          json['drawerConfig'] != null
              ? DraweConfig.fromJson(json['drawerConfig'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'key': key,
      'routeName': routeName,
      'type': type,
      'components': components.map((e) => e.toJson()).toList(),
      'initialState': initialState,
      'intialAction': intialAction,
      'drawerConfig': drawerConfig?.toJson(),
    };
  }
}

class DraweConfig {
  final Map<String, dynamic> config;
  DraweConfig({required this.config});

  factory DraweConfig.fromJson(Map<String, dynamic> json) {
    return DraweConfig(config: json['config']);
  }

  Map<String, dynamic> toJson() {
    return {'config': config};
  }
}

class Component {
  final String type;
  final Map<String, dynamic> params;
  Component({required this.type, required this.params});

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(type: json['type'], params: json['params']);
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'params': params};
  }
}
