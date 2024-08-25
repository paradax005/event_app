import 'package:event_app/features/forgot-password/presentation/widgets/dots_indicator.dart';
import 'package:event_app/global/theme/theme.dart';
import 'package:flutter/material.dart';

class FullDotsIndicators extends StatelessWidget {
  const FullDotsIndicators({
    required this.index,
    super.key,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DotsIndicator(
          color: index == 0 ? successColor : geryHintLoginInputColor,
        ),
        DotsIndicator(
          color: index == 1 ? successColor : geryHintLoginInputColor,
        ),
        DotsIndicator(
          color: index == 2 ? successColor : geryHintLoginInputColor,
        ),
      ],
    );
  }
}
