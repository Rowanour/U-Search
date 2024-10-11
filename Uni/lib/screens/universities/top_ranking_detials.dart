import 'package:flutter/material.dart';
import 'package:uni/utils/colors.dart';
import 'package:uni/utils/dimensions.dart';
import 'package:uni/widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_tex.dart';
import '../../widgets/small_text.dart';
import 'package:uni/models/unis_model.dart';

class TopRankingDetails extends StatelessWidget {
  final Uni uni;
  const TopRankingDetails({super.key, required this.uni});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.sky,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                toolbarHeight: 80,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: AppIcon(icon: Icons.arrow_back_ios),
                    ),
                    AppIcon(icon: Icons.favorite),
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20),
                  child: Container(
                    child: Center(child: BigText(text: uni.name)),
                    width: double.maxFinite,
                    padding: EdgeInsets.only(
                      bottom: Dimensions.height20,
                      top: Dimensions.height5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.sky,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20),
                      ),
                    ),
                  ),
                ),
                pinned: true,
                backgroundColor: AppColors.beige,
                expandedHeight: Dimensions.height350,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    uni.img,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: AppColors.sky,
                  padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20,
                  ),
                  child: Column(
                    children: [
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
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          SmallText(text: "4.5", color: AppColors.navy),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          SmallText(text: "100 ratings", color: AppColors.navy),
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
                              iconColor: AppColors.teal,
                            ),
                            IconAndText(
                              icon: Icons.location_pin,
                              text: uni.location,
                              iconColor: AppColors.teal,
                            ),
                          ],
                        ),
                      ),
                      Text(uni.description),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
