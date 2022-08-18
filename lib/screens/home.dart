import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/API/get_credits.dart';
import 'package:salafix/API/get_video.dart';
import 'package:salafix/API/getmovieDetails.dart';
import 'package:salafix/components/assets_manager.dart';
import 'package:salafix/components/color_manager.dart';
import 'package:salafix/components/styles_manager.dart';
import 'package:salafix/provider/data_provider.dart';
import 'package:salafix/screens/searchedMovie.dart';
import 'package:salafix/utils/percentage_indicator.dart';
import 'package:salafix/widgets/popularMovieList.dart';
import 'package:salafix/widgets/trendingMovieList.dart';
import 'package:salafix/widgets/upcomingMovieList.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final customCacheManager =
      CacheManager(Config("customCacheKey", stalePeriod: Duration(days: 10)));

  final Uri _url = Uri.parse('https://www.linkedin.com/company/livemint/');

  // @override
  // void initState() {
  //   super.initState();
  //   if (io.Platform.isAndroid) {
  //     WebView.platform = AndroidWebView();
  //   }
  //   ;
  // }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context, listen: true);
    final size = MediaQuery.of(context).size;
    String? images =
        provider.trend?.results![provider.homeIndex ?? 0].posterPath;
    // int? id = provider.trend?.results![provider.homeIndex ?? 0].id;
    final result = provider.trend?.results![provider.homeIndex ?? 0];
    final newImages = "$posterApi780$images";

    Future<void> _launchUrl() async {
      if (!await launchUrl(
        _url,
      )) {
        throw 'Could not launch $_url';
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent.withOpacity(.1),
          title: InkWell(
            // onTap: () {
            //   print("object");
            //   _launchUrl();
            // },
            child: Image.asset(
              ImageAssets.appBarlogo,
              height: 180,
            ),
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
                  // bottom: size.height * .4,
                  top: size.height * .115,
                  right: 10,
                  child: InkWell(
                    onTap: () async {
                      print(result!.mediaType);
                      result.mediaType == "movie"
                          ? await getVideo(context, result.id.toString())
                          : await getTvVideo(context, result.id.toString());
                      result.mediaType == "movie"
                          ? await getCredits(context, result.id.toString())
                          : await getTvCredits(context, result.id.toString());
                      result.mediaType == "movie"
                          ? await getMovieDetails(context, result.id.toString())
                          : await getTvDetails(context, result.id.toString());
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                        return SearchedMovie(
                          result: result,
                        );
                      }));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          // Icon(
                          //   Icons.play_arrow,
                          //   color: ColorManager.errorRed,
                          //   size: 30,
                          // ),
                          Shimmer.fromColors(
                            baseColor: ColorManager.indicatorBorGreen,
                            highlightColor: Colors.yellow,
                            child: Text(
                              'Show More',
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
                    )),
                Positioned(
                  left: 10,
                  top: size.height * .1,
                  child: PercentIndicator(percentage: result?.voteAverage),
                ),
              ],
            ),

            // * Trending movie list
            // TrendingMovieList(provider: provider),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 0, 20),
                  child: Text(
                    'Popular Movies',
                    style: getSemiBoldtStyle(
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
                  padding: const EdgeInsets.fromLTRB(8, 20, 0, 20),
                  child: Text(
                    'Upcoming Movies',
                    style: getSemiBoldtStyle(
                        color: ColorManager.whiteText, fontSize: 20),
                  ),
                )
              ],
            ),
            // * Upcoming movie list
            UpcomingMovieList(provider: provider),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 0, 20),
                  child: Text(
                    'Popular Tv Shows',
                    style: getSemiBoldtStyle(
                        color: ColorManager.whiteText, fontSize: 20),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 0, 20),
                  child: Text(
                    'Upcoming Tv Shows',
                    style: getSemiBoldtStyle(
                        color: ColorManager.whiteText, fontSize: 20),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 0, 20),
                  child: Text(
                    'Upcoming Movies',
                    style: getSemiBoldtStyle(
                        color: ColorManager.whiteText, fontSize: 20),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
