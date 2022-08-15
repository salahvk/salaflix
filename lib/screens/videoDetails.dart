import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salafix/components/color_manager.dart';
import 'package:salafix/provider/data_provider.dart';
import 'package:salafix/screens/trailerPlay.dart';

class VideoDetails extends StatefulWidget {
  const VideoDetails({Key? key}) : super(key: key);

  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context, listen: false);
    return Scaffold(
      body: ListView.builder(
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
              child: Container(
                height: 240,
                width: 600,
                color: ColorManager.whiteColor,
                child: Image.network(
                  'https://img.youtube.com/vi/$thumbnail/maxresdefault.jpg',
                  errorBuilder: (context, exception, stackTrace) {
                    return Image.network(
                        "https://img.youtube.com/vi/$thumbnail/hqdefault.jpg");
                  },
                  fit: BoxFit.fitWidth,
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
