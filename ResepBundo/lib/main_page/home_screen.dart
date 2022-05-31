import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:resep_mama/model/model.dart';
import 'package:resep_mama/services/services.dart';
import 'package:resep_mama/widget/catalog_item.dart';

import '../ui/detail_screen.dart';
import '../widget/caraousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String textName;

  @override
  Widget build(BuildContext context) {
    var recipes = RecipeApi();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff7fbfe),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder(
                    future: recipes.getRecipe(),
                    builder: (context, snapshot) => snapshot.data != null
                        ? _carouselSlider(snapshot.data as List<Recipes>)
                        : Center(child: CircularProgressIndicator())),

                // const Padding(
                //   padding: EdgeInsets.all(10),
                //   child: Text(
                //     "Pemeran saat ini",
                //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // const SizedBox(height: 10),

                ///Slider
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     SizedBox(
                //       height: 60,
                //       child: ListView(
                //         // padding: EdgeInsets.only(left: 10),
                //         scrollDirection: Axis.horizontal,
                //         children: catalog.map((catalog) {
                //           return CircleAvatar(
                //             backgroundImage: NetworkImage(catalog.director),
                //             radius: 40,
                //           );
                //         }).toList(),
                //       ),
                //     ),
                //   ],
                // ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Resep Popular",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                FutureBuilder(
                  future: recipes.getRecipe(),
                  builder: (context, snapshot) => snapshot.data != null
                      ? _listImageSlider(snapshot.data as List<Recipes>)
                      : Center(child: CircularProgressIndicator()),
                ),

                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Resep Terbaru",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                FutureBuilder(
                    future: recipes.getRecipe(),
                    builder: (context, snapshot) => snapshot.data != null
                        ? _listMovie(snapshot.data as List<Recipes>)
                        : Center(child: CircularProgressIndicator())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_listImageSlider(List<Recipes> lRecipes) {
  return Column(
    children: [
      SizedBox(
        height: 255,
        child: ListView.builder(
            itemCount: lRecipes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(Recipes: lRecipes[index]);
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SizedBox(
                    width: 180,
                    height: 225,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        lRecipes[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    ],
  );
}

Widget _listMovie(List<Recipes> catalog) {
  return ListView.builder(
      itemBuilder: (context, index) => CatalogItem(Recipes: catalog[index]),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: catalog.length);
}

// Widget _imageSlider(List<Catalog> catalog) {
//   return ListView.builder(
//       scrollDirection: Axis.vertical,
//       itemBuilder: (context, index) => const ImageSlider(Catalog: Catalog),
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: catalog.length);
// }

Widget _carouselSlider(List<Recipes> recipes) {
  return Container(
    child: CarouselSlider.builder(
      itemCount: recipes.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: 250,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
      itemBuilder: (context, i, id) {
        return CarouselSliderRecipe(recipes: recipes[i]);
      },
    ),
  );
}
