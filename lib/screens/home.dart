import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/components/assets_manager.dart';
import 'package:salafix/components/color_manager.dart';
import 'package:salafix/components/styles_manager.dart';
import 'package:salafix/provider/data_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImageAssets.appBarlogo,
          height: 200,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(
                    'Trending',
                    style: getRegularStyle(
                        color: ColorManager.whiteText, fontSize: 20),
                  ),
                )
              ],
            ),
            // * Trending movie list start
            Expanded(
                child: ListView.builder(
              itemBuilder: (ctx, index) {
                String? images = provider.trend!.results![index].posterPath;
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
                        child: Image.network(
                          newImages,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 15,
              scrollDirection: Axis.horizontal,
            )),
            // * Trending movie list end
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
            // * Popular movie list start
            Expanded(
                child: ListView.builder(
              itemBuilder: (ctx, index) {
                String? images = provider.popular!.results![index].posterPath;
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
                        child: Image.network(
                          newImages,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 15,
              scrollDirection: Axis.horizontal,
            )),
            // * Popular movie list end
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
            // * Upcoming movie list start
            Expanded(
                child: ListView.builder(
              itemBuilder: (ctx, index) {
                String? images = provider.upcoming!.results![index].posterPath;
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
                        child: Image.network(
                          newImages,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 15,
              scrollDirection: Axis.horizontal,
            )),
            // * Upcoming movie list end
          ],
        ),
      )),
    );
  }
}
