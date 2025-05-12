import 'package:flutter/material.dart';
import 'package:material_symbols_icons/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class Dashboardcard extends StatelessWidget {
  final int index;
  final String icon;
  final String title;
  final String stats;
  const Dashboardcard({
    super.key,
    required this.index,
    required this.icon,
    required this.title,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Text(
            index.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        subtitle: Text(
          stats,
          style: const TextStyle(color: Colors.grey, fontSize: 14.0),
        ),
        trailing: Icon(
          SymbolsGet.get(icon, SymbolStyle.outlined),
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
