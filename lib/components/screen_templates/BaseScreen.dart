import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdf/components/widgets/DashboardCard.dart';
import 'package:jdf/components/widgets/carousel.dart';
import 'package:jdf/components/widgets/materail_icon.dart';
import 'package:jdf/core/app_data_config_model.dart';
import 'package:jdf/mock/mock_config.dart';
import 'package:jdf/presentation/widgets/wdiget_renderer.dart'; // Import WidgetRenderer

class BaseScreen extends StatefulWidget {
  final Screen screenData;
  const BaseScreen({super.key, required this.screenData});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
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
      drawer:
          widget.screenData.drawerConfig != null
              ? Drawer(
                child: Column(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Container(
                        width: double.infinity,

                        child: Text(mockAppDataConfig.appName),
                      ),
                    ),
                    ...widget.screenData.drawerConfig!.config["drawerItems"]
                        .map((item) {
                          return ListTile(
                            leading: MaterailIcon(icon: item["icon"]),
                            title: Text(item["title"]),
                            onTap: () {
                             Navigator.of(context).pushNamed(item["route"]);
                            },
                          );
                        })
                        .toList(),
                    const Divider(),
                    ListTile(
                      title: const Text("Close"),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              )
              : null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 20.h,
        children:
            widget.screenData.components.map((component) {
              return loaclRenderer(component: component);
            }).toList(),
      ),
    );
  }

  Widget loaclRenderer({required Component component}) {
    print(component.type);
    print(component.params);
    print(state[component.params['dataKey']]?.length);

    switch (component.type) {
      case "carousel":
        return CarouselComponent(data: state[component.params['dataKey']]);
      case "list":
        return Expanded(
          child: ListView.builder(
            itemCount: state[component.params['dataKey']]?.length ?? 0,
            itemBuilder: (context, index) {
              final item = state[component.params['dataKey']][index];
              print(item);
              return Dashboardcard(
                index: index,
                icon: item["icon"],
                title: item["title"],
                stats: item["stats"],
              );
            },
          ),
        );

      default:
        return WidgetRenderer(
          component: component,
        ); // Fallback to WidgetRenderer for other types
    }
  }
}
