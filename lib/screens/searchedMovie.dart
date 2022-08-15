import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/components/color_manager.dart';
import 'package:salafix/components/styles_manager.dart';
import 'package:salafix/model/trending.dart';
import 'package:salafix/provider/data_provider.dart';

class SearchedMovie extends StatefulWidget {
  Results result;

  SearchedMovie({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  State<SearchedMovie> createState() => _SearchedMovieState();
}

class _SearchedMovieState extends State<SearchedMovie> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int? id = widget.result.id;
  }

  @override
  Widget build(BuildContext context) {
    final backImage = widget.result.backdropPath;
    final posterImage = widget.result.posterPath;
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<DataProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          title: RichText(
              text: TextSpan(children: [
        TextSpan(
          text: widget.result.title ?? widget.result.name!,
          style: getBoldtStyle(color: ColorManager.whiteColor, fontSize: 18),
        ),
        TextSpan(
          text: " (${widget.result.releaseDate?.substring(0, 4)})",
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
                )
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
            TopCast(provider: provider),
            // SizedBox(
            //   height: size.height * 0.24,
            // )
          ],
        ),
      ),
    );
  }
}

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
            onTap: () {
              // getTrending();
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
