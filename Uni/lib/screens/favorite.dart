import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni/screens/universities/top_ranking_detials.dart';
import 'package:uni/widgets/big_text.dart';
import 'package:uni/utils/colors.dart';
import '../favorites_provider.dart';
import '../utils/dimensions.dart';
import '../widgets/small_text.dart';


class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.sky,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: BigText(
                  text: "Favorites",
                  size: 30,
                  color: AppColors.navy,
                ),
              ),
            ),
            SizedBox(height: Dimensions.height20),
            favoritesProvider.favoriteUnis.isEmpty
                ? Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensions.height20),
                child: SmallText(
                  text: 'No favorites yet!',
                  color: AppColors.navy,
                  size: 14,
                ),
              ),
            )
                : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: favoritesProvider.favoriteUnis.length,
              itemBuilder: (context, index) {
                final uni = favoritesProvider.favoriteUnis[index];
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
                    height: Dimensions.height100,
                    margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10,
                      vertical: Dimensions.height20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(uni.img),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius30),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.navy.withOpacity(0.6),
                                AppColors.beige.withOpacity(0.3),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          right: 10,
                          child: ListTile(
                            title: Text(
                              uni.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              uni.location,
                              style: TextStyle(color: Colors.white70),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: AppColors.beige),
                              onPressed: () {
                                favoritesProvider.removeFavorite(uni);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
