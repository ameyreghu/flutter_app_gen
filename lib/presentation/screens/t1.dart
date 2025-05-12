import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdf/components/widgets/DashboardCard.dart';
import 'package:jdf/components/widgets/carousel.dart';

class T1S extends StatelessWidget {
  const T1S({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('T1 Screen')),
      body: Column(
        spacing: 10.h,
        children: [
          CarouselComponent(data: mockcarouesldata),
          ...[
                {
                  "title": "Market Overview",
                  "icon": "trending_down",
                  "stats": "Sensex Down by 2%",
                },
                {
                  "title": "Market Overview",
                  "icon": "trending_down",
                  "stats": "Sensex Down by 2%",
                },
                {
                  "title": "Market Overview",
                  "icon": "trending_down",
                  "stats": "Sensex Down by 2%",
                },
              ]
              .asMap()
              .entries
              .map(
                (entry) => Dashboardcard(
                  index: entry.key,
                  icon: entry.value['icon']!,
                  title: entry.value['title']!,
                  stats: entry.value['stats']!,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
