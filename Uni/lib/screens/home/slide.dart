import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uni/models/unis_model.dart';
import 'package:uni/utils/colors.dart';
import 'package:uni/utils/dimensions.dart';
import 'package:uni/widgets/big_text.dart';
import 'package:uni/widgets/icon_and_tex.dart';
import 'package:uni/widgets/small_text.dart';
import 'package:uni/cubit/uni_cubit.dart';
import '../universities/top_ranking_detials.dart';

class Slide extends StatefulWidget {
  const Slide({super.key});

  @override
  State<Slide> createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  PageController pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider section
        Container(
          height: Dimensions.pageView,
          child: BlocBuilder<UniCupit, List<Uni>>(builder: (context, state) {
            if (state.isEmpty) {
              return Center(
                child: CircularProgressIndicator(), // Loading indicator
              );
            } else if (state == null) {
              return Center(
                child: Text("Failed to load data"), // Handle null state
              );
            } else {
              return PageView.builder(
                controller: pageController,
                itemCount: state.length, // Dynamic page count
                itemBuilder: (context, position) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TopRankingDetails(uni: state[position]),
                        ),
                      );
                    },
                    child: _buildPageItem(position, state[position]), // Pass Uni object
                  );
                },
              );
            }
          }),
        ),

        // Dot indicator
        SmoothPageIndicator(
          controller: pageController,
          count: 5,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.navy,
            dotColor: AppColors.sky,
          ),
        ),

        // Ranking text
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            children: [
              BigText(text: 'Top Universities By Ranking'),
            ],
          ),
        ),

        // List of universities
        BlocBuilder<UniCupit, List<Uni>>(builder: (context, state) {
          if (state.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state == null) {
            return Center(
              child: Text("Failed to load universities"),
            );
          } else {
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.length,
              itemBuilder: (context, index) {
                final uni = state[index]; // Fetch current university

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TopRankingDetails(uni: uni),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height15,
                    ),
                    child: Row(
                      children: [
                        // Image section
                        Container(
                          width: Dimensions.height140,
                          height: Dimensions.height140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius25),
                            color: AppColors.sky,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(uni.img), // Dynamic image
                            ),
                          ),
                        ),

                        // Text section
                        Expanded(
                          child: Container(
                            height: Dimensions.height100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(Dimensions.radius30),
                                topRight: Radius.circular(Dimensions.radius30),
                              ),
                              color: Color(0xFFE5DDDC),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: uni.name), // Dynamic name
                                  SizedBox(height: Dimensions.height5),
                                  SmallText(text: uni.description), // Dynamic description
                                  SizedBox(height: Dimensions.height10),
                                  Row(
                                    children: [
                                      IconAndText(
                                        icon: Icons.format_list_numbered,
                                        text: "Ranking",
                                        iconColor: AppColors.inv,
                                      ),
                                      IconAndText(
                                        icon: Icons.location_pin,
                                        text: uni.location, // Dynamic location
                                        iconColor: AppColors.inv,
                                      ),
                                      IconAndText(
                                        icon: Icons.star,
                                        text: "Rating",
                                        iconColor: AppColors.inv,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }),
      ],
    );
  }

  // Slider components
  Widget _buildPageItem(int index, Uni uni) {
    return Stack(
      children: [
        // Top part
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(uni.img), // Dynamic image
            ),
          ),
        ),

        // Bottom text part
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
              left: Dimensions.width35,
              right: Dimensions.width35,
              bottom: Dimensions.height30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: AppColors.sky,
              boxShadow: [
                BoxShadow(
                  color: Color(0x6C333C59),
                  blurRadius: Dimensions.radius5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.height10,
                horizontal: Dimensions.width10,
              ),
              child: Column(
                children: [
                  BigText(text: uni.name), // Dynamic name
                  SizedBox(height: Dimensions.height10),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                              (index) => Icon(
                            Icons.star,
                            color: AppColors.inv,
                            size: Dimensions.height15,
                          ),
                        ),
                      ),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: "4.5", color: AppColors.navy),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: "100 ratings", color: AppColors.navy),
                    ],
                  ),
                  SizedBox(height: Dimensions.height10),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconAndText(
                          icon: Icons.format_list_numbered,
                          text: "Ranking",
                          iconColor: AppColors.teal,
                        ),
                        IconAndText(
                          icon: Icons.location_pin,
                          text: uni.location, // Dynamic location
                          iconColor: AppColors.teal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
