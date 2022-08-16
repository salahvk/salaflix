import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/API/get_video.dart';
import 'package:salafix/components/assets_manager.dart';
import 'package:salafix/components/color_manager.dart';
import 'package:salafix/components/styles_manager.dart';
import 'package:salafix/provider/data_provider.dart';
import 'package:salafix/screens/videoDetails.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final customCacheManager =
      CacheManager(Config("customCacheKey", stalePeriod: Duration(days: 10)));

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context, listen: true);
    final size = MediaQuery.of(context).size;
    String? images =
        provider.trend?.results![provider.homeIndex ?? 0].posterPath;
    int? id = provider.trend?.results![provider.homeIndex ?? 0].id;
    final newImages = "$posterApi780$images";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent.withOpacity(.1),
          title: Image.asset(
            ImageAssets.appBarlogo,
            height: 180,
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * .7,
                  // color: ColorManager.whiteColor,
                  child: CachedNetworkImage(
                    imageUrl: newImages,
                    fit: BoxFit.cover,
                    cacheManager: customCacheManager,
                  ),
                ),
                Positioned(
                  bottom: size.height * .4,
                  right: 10,
                  child: InkWell(
                    onTap: () async {
                      await getVideo(context, id.toString());
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                        return VideoDetails();
                      }));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: ColorManager.errorRed,
                            size: 30,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.red,
                            highlightColor: Colors.yellow,
                            child: Text(
                              ' Play Trailer',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeightManager.bold,
                                shadows: [
                                  // Shadow(
                                  //   blurRadius: 15.0,
                                  //   color: ColorManager.background,
                                  //   offset: Offset(5.0, 5.0),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: 2,
                    bottom: 0,
                    right: 0,
                    // top: 0,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                'Trending',
                                style: TextStyle(
                                  fontSize: 20,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: ColorManager.background,
                                      offset: Offset(5.0, 5.0),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        TrendingMovieList(provider: provider),
                      ],
                    ))
              ],
            ),

            // * Trending movie list
            // TrendingMovieList(provider: provider),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(
                    'Popular',
                    style: getRegularStyle(
                        color: ColorManager.whiteText, fontSize: 20),
                  ),
                )
              ],
            ),
            // * Popular movie list
            PopularMovieList(provider: provider),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(
                    'Upcoming',
                    style: getRegularStyle(
                        color: ColorManager.whiteText, fontSize: 20),
                  ),
                )
              ],
            ),
            // * Upcoming movie list
            UpcomingMovieList(provider: provider),
          ],
        ),
      ),
    );
  }
}

class UpcomingMovieList extends StatelessWidget {
  const UpcomingMovieList({
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
            String? images = provider.upcoming?.results![index].posterPath;
            final newImages = "$posterApi$images";
            return InkWell(
              onTap: () {
                // getTrending();
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

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({
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
            String? images = provider.popular?.results![index].posterPath;
            final newImages = "$posterApi$images";
            return InkWell(
              onTap: () {
                // getTrending();
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
                // getTrending();

                provider.homeindexData(index);
                print(provider.homeIndex);
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
