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
  void initState() {
    final provider = Provider.of<DataProvider>(context, listen: false);
    // TODO: implement initState
    super.initState();
    // if (provider.search != null) {
    //   provider.clean();
    // }
  }

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
            // * Trending movie list
            TrendingMovieList(provider: provider),

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
      )),
    );
  }
}

class UpcomingMovieList extends StatelessWidget {
  const UpcomingMovieList({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final DataProvider provider;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 2,
        child: ListView.builder(
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
        ));
  }
}

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final DataProvider provider;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 2,
        child: ListView.builder(
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
        ));
  }
}

class TrendingMovieList extends StatelessWidget {
  const TrendingMovieList({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final DataProvider provider;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Flexible(
        flex: 3,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            String? images = provider.trend?.results![index].posterPath;
            final newImages = "$posterApi$images";
            return InkWell(
              onTap: () {
                // getTrending();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: size.width * 0.45,
                  decoration: BoxDecoration(
                      color: ColorManager.grayLight,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ColorManager.grayLight)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      newImages,
                      fit: BoxFit.fill,
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
