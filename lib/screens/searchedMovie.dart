import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/API/get_credits.dart';
import 'package:salafix/API/get_video.dart';
import 'package:salafix/API/getmovieDetails.dart';
import 'package:salafix/components/color_manager.dart';
import 'package:salafix/components/styles_manager.dart';
import 'package:salafix/model/trending.dart';
import 'package:salafix/provider/data_provider.dart';
import 'package:salafix/provider/movie_details_provider.dart';
import 'package:salafix/screens/videoDetails.dart';
import 'package:salafix/utils/percentage_indicator.dart';
import 'package:salafix/utils/shimmer_top_cast.dart';
import 'package:salafix/widgets/topCast.dart';

class SearchedMovie extends StatefulWidget {
  final Results result;
  String? mediaType;

  SearchedMovie({Key? key, required this.result, this.mediaType})
      : super(key: key);

  @override
  State<SearchedMovie> createState() => _SearchedMovieState();
}

class _SearchedMovieState extends State<SearchedMovie> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getInitData(widget.result, widget.mediaType);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context, listen: true);
    final mProvider = Provider.of<MovieProvider>(context, listen: true);
    final size = MediaQuery.of(context).size;
    final backImage = widget.result.backdropPath;
    final posterImage = widget.result.posterPath;
    final genreLength = mProvider.movieDetails?.genres?.length;

    return Scaffold(
      appBar: AppBar(
          title: RichText(
              text: TextSpan(children: [
        TextSpan(
          text: widget.result.title ?? widget.result.name!,
          style: getBoldtStyle(color: ColorManager.whiteColor, fontSize: 18),
        ),
        TextSpan(
          text: widget.result.releaseDate != null
              ? " (${widget.result.releaseDate?.substring(0, 4)})"
              : " (${widget.result.firstAirDate?.substring(0, 4)})",
          style: getRegularStyle(color: ColorManager.grayLight, fontSize: 16),
        )
      ]))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 260,
                  width: size.width,
                  child: backImage != null
                      ? Image.network(
                          "$posterApi$backImage",
                          color: Colors.white.withOpacity(0.4),
                          colorBlendMode: BlendMode.modulate,
                          fit: BoxFit.fill,
                        )
                      : Container(),
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 220,
                      width: size.width * .3,
                      child: backImage != null
                          ? Image.network(
                              "$posterApi$posterImage",
                              fit: BoxFit.fill,
                            )
                          : Container(),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 125,
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                        return VideoDetails();
                      }));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: ColorManager.whiteColor,
                            size: 30,
                          ),
                          Text(
                            ' Play Trailer',
                            style: getSemiBoldtStyle(
                                color: ColorManager.whiteText, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: size.width * .35,
                    bottom: 115,
                    child: widget.result.voteAverage != 0
                        ? PercentIndicator(
                            percentage: widget.result.voteAverage)
                        : Container()),
                Positioned(
                    left: size.width * .35,
                    top: 10,
                    child: genreLength != 0 && genreLength != null
                        ? Row(
                            children: [
                              Text(
                                "${mProvider.movieDetails?.genres?[0].name}",
                                style: getRegularStyle(
                                    color: ColorManager.whiteText),
                              ),
                              genreLength >= 2
                                  ? Text(
                                      ", ${mProvider.movieDetails?.genres?[1].name}",
                                      style: getRegularStyle(
                                          color: ColorManager.whiteText),
                                    )
                                  : Text(''),
                              genreLength >= 3
                                  ? Text(
                                      ", ${mProvider.movieDetails?.genres?[2].name}",
                                      style: getRegularStyle(
                                          color: ColorManager.whiteText),
                                    )
                                  : Text(''),
                            ],
                          )
                        : Container())
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Rating ",
                      style: getRegularStyle(
                          color: ColorManager.errorRed, fontSize: 16)),
                  TextSpan(
                      text: "${widget.result.voteAverage}",
                      style: getRegularStyle(
                          color: ColorManager.blueLight, fontSize: 16))
                ]))),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
              child: Container(
                child: Text(
                  widget.result.overview!,
                  textAlign: TextAlign.justify,
                  style: getMediumtStyle(
                      color: ColorManager.grayLight, fontSize: 14),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 14, 8, 0),
              child: Row(
                children: [
                  Text(
                    'Top Billed Cast',
                    style: getBoldtStyle(
                        color: ColorManager.whiteText, fontSize: 14),
                  ),
                ],
              ),
            ),
            provider.credit != null
                ? TopCast(provider: provider)
                : ShimmerTopCast(size: size)
          ],
        ),
      ),
    );
  }

  getInitData(Results result, String? mediaType) async {
    final provider = Provider.of<DataProvider>(context, listen: false);
    final mProvider = Provider.of<MovieProvider>(context, listen: false);
    provider.cleanCredits();
    provider.cleanVideo();
    mProvider.cleanDetails();

    result.mediaType == "movie" || mediaType == "MOVIE"
        ? await getVideo(context, result.id.toString())
        : await getTvVideo(context, result.id.toString());
    result.mediaType == "movie" || mediaType == "MOVIE"
        ? await getCredits(context, result.id.toString())
        : await getTvCredits(context, result.id.toString());
    result.mediaType == "movie" || mediaType == "MOVIE"
        ? await getMovieDetails(context, result.id.toString())
        : await getTvDetails(context, result.id.toString());
  }
}
