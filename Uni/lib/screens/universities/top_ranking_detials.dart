import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni/models/unis_model.dart';
import 'package:uni/utils/colors.dart';
import 'package:uni/utils/dimensions.dart';
import 'package:uni/widgets/app_icon.dart';
import '../../favorites_provider.dart';
import '../../widgets/big_text.dart';

class TopRankingDetails extends StatelessWidget {
  final Uni uni;
  const TopRankingDetails({super.key, required this.uni});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

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
                    GestureDetector(
                      onTap: () {
                        if (favoritesProvider.isFavorite(uni)) {
                          favoritesProvider.removeFavorite(uni);
                        } else {
                          favoritesProvider.addFavorite(uni);
                        }
                      },
                      child: AppIcon(
                        icon: favoritesProvider.isFavorite(uni)
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                    ),
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
                      /*Row(
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
                          Text("4.5", style: TextStyle(color: AppColors.navy)),
                          SizedBox(width: Dimensions.width10),
                          Text("100 ratings", style: TextStyle(color: AppColors.navy)),
                        ],
                      ),*/
                      SizedBox(height: Dimensions.height10),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.format_list_numbered),
                            Text("Ranking: ${uni.id}"),
                            Icon(Icons.location_pin),
                            Text(uni.location),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.height20),

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
