import 'package:flutter/material.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/components/color_manager.dart';
import 'package:salafix/components/styles_manager.dart';
import 'package:salafix/model/trending.dart';

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
  Widget build(BuildContext context) {
    final image = widget.result.backdropPath;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.result.title!),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 200,
            width: size.width,
            child: image != null
                ? Image.network(
                    "$posterApi$image",
                    fit: BoxFit.fill,
                  )
                : Container(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: Container(
              child: Text(
                widget.result.overview!,
                textAlign: TextAlign.justify,
                style: getMediumtStyle(
                    color: ColorManager.grayLight, fontSize: 14),
              ),
            ),
          )
        ],
      )),
    );
  }
}
