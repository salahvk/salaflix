import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';

import 'package:salafix/components/color_manager.dart';
import 'package:salafix/provider/data_provider.dart';

class TrendingMovieList extends StatefulWidget {
  const TrendingMovieList({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final DataProvider provider;

  @override
  State<TrendingMovieList> createState() => _TrendingMovieListState();
}

class _TrendingMovieListState extends State<TrendingMovieList> {
  static final customCacheManager =
      CacheManager(Config("customCacheKey", stalePeriod: Duration(days: 10)));
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Container(
        height: 180,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            String? images = widget.provider.trend?.results![index].posterPath;
            final newImages = "$posterApi$images";
            return InkWell(
              onTap: () {
                provider.homeindexData(index);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                      color: ColorManager.grayLight,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ColorManager.grayLight)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: newImages,
                      fit: BoxFit.fill,
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
