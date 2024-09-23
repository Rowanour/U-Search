import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uni/utils/colors.dart';
import 'package:uni/utils/dimensions.dart';
import 'package:uni/widgets/big_text.dart';
import 'package:uni/widgets/icon_and_tex.dart';
import 'package:uni/widgets/small_text.dart';

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
        //slider section
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        //dot indicator
        SmoothPageIndicator(
          controller: pageController,
          count: 5,
          effect: ExpandingDotsEffect(
              activeDotColor: AppColors.navy, dotColor: AppColors.sky),
        ),

        //Ranking text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            children: [
              BigText(text: 'Top Universities By Ranking'),
            ],
          ),
        ),

        //list universities
        ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height15),
                  child: Row(
                    children: [
                      //image section
                      Container(
                        width: Dimensions.height140,
                        height: Dimensions.height140,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius25),
                            color: AppColors.sky,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/img_4.png',
                                ))),
                      ),
                      //text section
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
                            padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(
                                    text:
                                        'egypt japan university of science and technology'),
                                SizedBox(height: Dimensions.height5,),
                                SmallText(
                                    text:
                                        'Egypt-Japan University of Science and Technology (E-JUST) is a research university with an ambition to cultivate an academic environment and become a benchmark for the Egyptian and African countries in education.'),
                                SizedBox(height: Dimensions.height10,),
                                Row(

                                  children: [
                                    IconAndText(
                                        icon: Icons.format_list_numbered,
                                        text: "Ranking",
                                        iconColor: AppColors.inv),
                                    IconAndText(
                                        icon: Icons.location_pin,
                                        text: "Location",
                                        iconColor: AppColors.inv),
                                    IconAndText(
                                        icon: Icons.star,
                                        text: "Rating",
                                        iconColor: AppColors.inv),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })
      ],
    );
  }

  //slider components
  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(
              left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/img_4.png"))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width35,
                right: Dimensions.width35,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.sky,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x6C333C59),
                    blurRadius: Dimensions.radius5,
                    offset: Offset(0, 5),
                  )
                ]),
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                  left: Dimensions.width10,
                  right: Dimensions.width10),
              child: Column(
                children: [
                  BigText(text: "E-JUST"),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  color: AppColors.inv,
                                  size: Dimensions.height15,
                                )),
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      SmallText(text: "4.5", color: AppColors.navy),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      SmallText(text: "100 ratings", color: AppColors.navy)
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height10, // Adjust the height as needed
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconAndText(
                            icon: Icons.format_list_numbered,
                            text: "Ranking",
                            iconColor: AppColors.teal),
                        IconAndText(
                            icon: Icons.location_pin,
                            text: "Location",
                            iconColor: AppColors.teal),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
