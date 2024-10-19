import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni/models/unis_model.dart';
import 'package:uni/screens/home/slide.dart';
import 'package:uni/services/uni_service.dart';
import 'package:uni/utils/colors.dart';
import 'package:uni/utils/dimensions.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<Uni> universities = [];
  List<Uni> filteredUniversities = [];

  @override
  void initState() {
    super.initState();
    fetchUniversities();
  }

  Future<void> fetchUniversities() async {
    try {
      UniService uniService = UniService();
      List<Uni> result = await uniService.getUni();
      setState(() {
        universities = result;
      });
    } catch (e) {
      print('Error fetching universities: $e');
    }
  }

  void searchUniversity(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredUniversities = [];
      } else {
        filteredUniversities = universities
            .where((university) =>
            university.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isSearching
                      ? Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        top: Dimensions.height10,
                        bottom: Dimensions.height10,
                      ),
                      child: TextField(
                        controller: searchController,
                        autofocus: true,
                        onChanged: searchUniversity,
                        decoration: InputDecoration(
                          hintText: 'Search Universities...',
                          border: InputBorder.none,
                        ),
                        style: GoogleFonts.lobster(
                          textStyle: TextStyle(
                            color: AppColors.navy,
                            fontWeight: FontWeight.w700,
                            fontSize: Dimensions.font12,
                          ),
                        ),
                      ),
                    ),
                  )
                      : Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      top: Dimensions.height10,
                      bottom: Dimensions.height10,
                    ),
                    child: Text(
                      'U Search',
                      style: GoogleFonts.lobster(
                        textStyle: TextStyle(
                          color: AppColors.navy,
                          fontWeight: FontWeight.w700,
                          fontSize: Dimensions.font25,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: Dimensions.width20,
                      bottom: Dimensions.height10,
                      top: Dimensions.height10,
                    ),
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSearching = !isSearching;
                          if (!isSearching) {
                            searchController.clear();
                            filteredUniversities.clear();
                          }
                        });
                      },
                      child: Icon(
                        isSearching ? Icons.close : Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.navy,
                    ),
                  ),
                ],
              ),
            ),
            if (isSearching)
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (filteredUniversities.isNotEmpty) ...[
                          for (var university in filteredUniversities)
                            ListTile(
                              title: Text(university.name),
                              subtitle: Text(university.location),
                            ),
                        ] else if (searchController.text.isNotEmpty) ...[
                          Padding(
                            padding: EdgeInsets.all(Dimensions.width20),
                            child: Text(
                              'No results found.',
                              style: TextStyle(
                                fontSize: Dimensions.font20,
                                color: AppColors.navy,
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: SingleChildScrollView(
                  child: Slide(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
