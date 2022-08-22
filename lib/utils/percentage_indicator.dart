import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:salafix/components/color_manager.dart';
import 'package:salafix/components/styles_manager.dart';

class PercentIndicator extends StatelessWidget {
  final percentage;
  const PercentIndicator({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final multipliedPercentage = percentage * 10;
    return CircularPercentIndicator(
      radius: 30.0,
      lineWidth: 6.0,
      percent: percentage / 10,
      center: new CircleAvatar(
        radius: 24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${multipliedPercentage.toString().substring(0, 2)}%",
              style: getBoldtStyle(color: ColorManager.whiteText, fontSize: 15),
            ),
            Text(
              "Rating",
              style:
                  getRegularStyle(color: ColorManager.whiteText, fontSize: 6),
            ),
          ],
        ),
        backgroundColor: ColorManager.darkGreen,
      ),
      backgroundColor: ColorManager.indicatorBorGreen,
      progressColor: ColorManager.lightGreen,
    );
  }
}
