import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/components/color_manager.dart';
import 'package:salafix/provider/data_provider.dart';
import 'package:salafix/screens/searchedMovie.dart';

class TopRatedTv extends StatelessWidget {
  TopRatedTv({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final DataProvider provider;
  static final customCacheManager =
      CacheManager(Config("customCacheKey", stalePeriod: Duration(days: 10)));

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            final result = provider.topRatedTv!.results![index];
            final newImages = "$posterApi${result.posterPath}";
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return SearchedMovie(
                    result: result,
                  );
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  width: 120,
                  decoration: BoxDecoration(
                      color: ColorManager.grayLight,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ColorManager.grayLight)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: newImages,
                      fit: BoxFit.cover,
                      cacheManager: customCacheManager,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: 15,
          scrollDirection: Axis.horizontal,
        ));
  }
}
