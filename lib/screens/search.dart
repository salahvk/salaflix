import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/model/trending.dart';
import 'package:salafix/provider/data_provider.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;
  int? len;

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
    final provider = Provider.of<DataProvider>(context, listen: false);
    // TODO: implement initState
    super.initState();
    len = 0;
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
          Container(
              child: TextField(
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
                  })),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final provider =
                    Provider.of<DataProvider>(context, listen: true);
                final image = provider.search?.results?[index].posterPath;
                final title = provider.search?.results![index].title;
                final newImages = "$posterApi$image";
                return ListTile(
                  leading: Container(
                    height: 20,
                    child: image != null ? Image.network(newImages) : Text(''),
                  ),
                  title: Text(title ?? ""),
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
