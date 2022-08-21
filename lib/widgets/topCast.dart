import 'package:flutter/material.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/components/color_manager.dart';
import 'package:salafix/components/styles_manager.dart';
import 'package:salafix/provider/data_provider.dart';

class TopCast extends StatelessWidget {
  const TopCast({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final DataProvider provider;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 280,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          String? ActorName = provider.credit!.cast![index].name;
          String? CharacterName = provider.credit!.cast![index].character;
          String? images = provider.credit!.cast![index].profilePath;
          final newImages = "$posterApi$images";
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 14, 8, 0),
              child: Container(
                width: size.width * 0.3,
                decoration: BoxDecoration(
                    color: ColorManager.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorManager.grayLight)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 190,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: images != null
                            ? Image.network(
                                newImages,
                                fit: BoxFit.fill,
                              )
                            : Image.network(
                                noImageAvailable,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ActorName ?? "",
                              maxLines: 2,
                              style: getBoldtStyle(
                                  color: ColorManager.background,
                                  fontSize: 14)),
                          Text(CharacterName ?? "",
                              maxLines: 1,
                              style: getMediumtStyle(
                                  color: ColorManager.background,
                                  fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: provider.credit?.cast?.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
