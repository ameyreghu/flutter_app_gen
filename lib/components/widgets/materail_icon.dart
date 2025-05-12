import 'package:flutter/material.dart';
import 'package:material_symbols_icons/get.dart';

class MaterailIcon extends StatelessWidget {
  final String icon;
  final SymbolStyle style;
  final double size;
  const MaterailIcon({super.key, required this.icon,this.style= SymbolStyle.outlined, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return Icon(
      SymbolsGet.get(icon, style),
      size: size,
      color: Theme.of(context).primaryColor,
    );
  }
}