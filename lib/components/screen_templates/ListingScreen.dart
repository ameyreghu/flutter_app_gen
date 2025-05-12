import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdf/components/widgets/DashboardCard.dart';
import 'package:jdf/components/widgets/carousel.dart';
import 'package:jdf/components/widgets/materail_icon.dart';
import 'package:jdf/core/app_data_config_model.dart';
import 'package:jdf/data/basic_network_layer.dart';
import 'package:jdf/mock/mock_config.dart';
import 'package:jdf/presentation/widgets/common_widgets.dart';
import 'package:jdf/presentation/widgets/wdiget_renderer.dart'; // Import WidgetRenderer

class ListingScreen extends StatefulWidget {
  final Screen screenData;
  const ListingScreen({super.key, required this.screenData});

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  Map<String, dynamic> state = {};

  @override
  void initState() {
    super.initState();
    state = {...widget.screenData.initialState, "loading": false};
    handleInitialAction();
  }

  handleInitialAction() async {
    if (widget.screenData.intialAction.isEmpty) return;
    final action = widget.screenData.intialAction;
    print(action);

    switch (action['type']) {
      case "fetch":
        setState(() {
          state["loading"] = true;
        });
        var result = await getData(url: action['url']!);
        print(result);
        result.when((res) {
          print('val $res');
          setState(() {
            state[action['dataKey']!] = res;
          });
        }, (e) {});
        setState(() {
          state["loading"] = false;
        });

        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.screenData.title)),
      body:
          state['loading']
              ? LoadingIndicator()
              : Column(
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
        final itemExtractor = component.params['itemExtractor'];
        print('itemExtractor');
        print(itemExtractor);
        return Expanded(
          child: ListView.builder(
            itemCount: state[component.params['dataKey']]?.length ?? 0,
            itemBuilder: (context, index) {
              final item = state[component.params['dataKey']][index];

              print(item);
              return ListTile(
                leading: CircleAvatar(
                  // backgroundColor: Theme.of(context).cardColor,
                  child: Text(item[itemExtractor['id']].toString()),
                ),
                title: Text(item[itemExtractor['title']] ?? ''),
                subtitle: Text(item[itemExtractor['subtitle']] ?? ''),
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
