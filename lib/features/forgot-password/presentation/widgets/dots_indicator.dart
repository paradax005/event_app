import 'package:event_app/global/theme/theme.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
    this.color = geryHintLoginInputColor,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 55,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
