import 'package:flutter/material.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/components/color_manager.dart';
import 'package:salafix/components/styles_manager.dart';
import 'package:salafix/provider/data_provider.dart';
import 'package:salafix/widgets/person_details.dart';

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
          final Person = provider.credit!.cast![index];
          final newImages = "$posterApi${Person.profilePath}";
          return InkWell(
            onTap: () {
              print(Person.id);
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return PersonalDetails(id: Person.id.toString());
              }));
            },
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
                        child: Person.profilePath != null
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
                          Text(Person.name ?? "",
                              maxLines: 2,
                              style: getBoldtStyle(
                                  color: ColorManager.background,
                                  fontSize: 14)),
                          Text(Person.character ?? "",
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
