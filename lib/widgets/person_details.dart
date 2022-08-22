import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/API/get_person_details.dart';
import 'package:salafix/provider/data_provider.dart';

class PersonalDetails extends StatefulWidget {
  final String id;
  const PersonalDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getPerson(context, widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context, listen: true);
    final size = MediaQuery.of(context).size;
    final newImages = "$posterApi${provider.personalModel!.profilePath}";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * .35,
                // color: ColorManager.errorRed,
                child: Column(
                  children: [
                    Container(
                      height: 190,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: provider.personalModel!.profilePath != null
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
                  ],
                ),
              ),
              Container(
                width: size.width * .65,
                // color: ColorManager.blue,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("${provider.personalModel!.biography}")],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
