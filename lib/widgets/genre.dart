import 'package:flutter/cupertino.dart';
import 'package:salafix/components/color_manager.dart';
import 'package:salafix/components/styles_manager.dart';
import 'package:salafix/provider/movie_details_provider.dart';

class PositionedGenre extends StatelessWidget {
  const PositionedGenre({
    Key? key,
    required this.size,
    required this.genreLength,
    required this.mProvider,
  }) : super(key: key);

  final Size size;
  final int? genreLength;
  final MovieProvider mProvider;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: size.width * .35,
        top: 10,
        child: genreLength != 0 && genreLength != null
            ? Row(
                children: [
                  Text(
                    "${mProvider.movieDetails?.genres?[0].name}",
                    style: getRegularStyle(
                        color: ColorManager.whiteText, fontSize: 10),
                  ),
                  genreLength! >= 2
                      ? Text(
                          ", ${mProvider.movieDetails?.genres?[1].name}",
                          style: getRegularStyle(
                              color: ColorManager.whiteText, fontSize: 10),
                        )
                      : Text(''),
                  genreLength! >= 3
                      ? Text(
                          ", ${mProvider.movieDetails?.genres?[2].name}",
                          style: getRegularStyle(
                              color: ColorManager.whiteText, fontSize: 10),
                        )
                      : Text(''),
                ],
              )
            : Container());
  }
}
