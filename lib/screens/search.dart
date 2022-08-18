import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/API/get_credits.dart';
import 'package:salafix/API/get_video.dart';

import 'package:salafix/model/trending.dart';
import 'package:salafix/provider/data_provider.dart';
import 'package:salafix/screens/searchedMovie.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;
  int? len;
  final FocusNode focusActive = FocusNode();

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      getSearchResults(context, query);
    });
  }

  getSearchResults(BuildContext context, String query) async {
    final provider = Provider.of<DataProvider>(context, listen: false);
    var response = await http.get(Uri.parse("$searchApi$query"));
    var jsonResponse = jsonDecode(response.body);
    var search = Trending.fromJson(jsonResponse);

    setState(() {
      len = search.results!.length;
    });
    provider.searchData = search;
  }

  @override
  void initState() {
    super.initState();
    len = 0;
    focusActive.requestFocus();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 50,
              child: TextField(
                  focusNode: focusActive,
                  decoration: InputDecoration(
                    hintText: "Search for Movies",
                  ),
                  controller: searchController,
                  onChanged: (value) {
                    if (value.length == 0) {
                      provider.clean;
                      print("object");
                      setState(() {
                        len = 0;
                      });
                      print(len);
                      return;
                    }

                    _onSearchChanged(value);
                  }),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final provider =
                    Provider.of<DataProvider>(context, listen: true);
                final image = provider.search?.results?[index].posterPath;
                final title = provider.search?.results![index].title;
                Results result = provider.search!.results![index];
                final newImages = "$posterApi$image";
                return SearchResult(
                  image: image,
                  newImages: newImages,
                  result: result,
                );
              },
              itemCount: len,
            ),
          )
        ],
      )),
    );
  }
}

// ignore: must_be_immutable
class SearchResult extends StatefulWidget {
  SearchResult({
    Key? key,
    required this.image,
    required this.newImages,
    required this.result,
  }) : super(key: key);

  final String? image;
  final String newImages;
  Results result;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        print(widget.result.title ?? widget.result.name);
        print(widget.result.overview);
        print(widget.result.id);
        widget.result.mediaType == "movie"
            ? await getCredits(context, widget.result.id.toString())
            : await getTvCredits(context, widget.result.id.toString());
        widget.result.mediaType == "movie"
            ? await getVideo(context, widget.result.id.toString())
            : await getTvVideo(context, widget.result.id.toString());
        //  await getMovieDetails(context, widget.result.id.toString());
        print("Wait finished");

        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return SearchedMovie(
            result: widget.result,
          );
        }));
      },
      child: ListTile(
        leading: Container(
          height: 40,
          child:
              widget.image != null ? Image.network(widget.newImages) : Text(''),
        ),
        title: Text(widget.result.title ?? widget.result.name!),
      ),
    );
  }
}
