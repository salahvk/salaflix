import 'package:flutter/material.dart';
import 'package:salafix/components/color_manager.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTopCast extends StatelessWidget {
  const ShimmerTopCast({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 14, 8, 0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[600]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: size.width * 0.3,
                decoration: BoxDecoration(
                    color: ColorManager.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorManager.grayLight)),
              ),
            ),
          );
        },
      ),
    );
  }
}
