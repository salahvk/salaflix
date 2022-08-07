import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/components/color_manager.dart';
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
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [],
          ),
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
          Container(
            height: size.height * 0.66,
          )
        ],
      )),
    );
  }
}
