import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salafix/components/color_manager.dart';
import 'package:salafix/components/styles_manager.dart';
import 'package:salafix/provider/data_provider.dart';
import 'package:salafix/screens/trailerPlay.dart';
import 'package:shimmer/shimmer.dart';

class VideoDetails extends StatefulWidget {
  const VideoDetails({Key? key}) : super(key: key);

  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context, listen: false);
    final confirmThumbnail = provider.video?.results!.length;
    print(confirmThumbnail);
    return Scaffold(
      body: confirmThumbnail == 0
          ? Center(
              child: Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: Text(
                    "No Trailer Available",
                    style: getBoldtStyle(
                        color: ColorManager.background, fontSize: 17),
                  )),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                final thumbnail = provider.video!.results![index].key;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                        return TrailerDisplayPage(videoId: thumbnail!);
                      }));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 240,
                            width: 600,
                            decoration: BoxDecoration(),
                            child: Image.network(
                              'https://img.youtube.com/vi/$thumbnail/maxresdefault.jpg',
                              errorBuilder: (context, exception, stackTrace) {
                                return Image.network(
                                    "https://img.youtube.com/vi/$thumbnail/hqdefault.jpg");
                              },
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.play_arrow,
                              color: ColorManager.whiteColor,
                              size: 40,
                              shadows: [
                                Shadow(
                                  blurRadius: 15.0,
                                  color: ColorManager.background,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: provider.video!.results?.length,
            ),
    );
  }
}
