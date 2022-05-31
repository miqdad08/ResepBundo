import 'package:flutter/material.dart';
import 'package:resep_mama/services/services.dart';

import '../model/model.dart';
import '../widget/catalog_item.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

TextEditingController controller = new TextEditingController();

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    var recipes = RecipeApi();
    return Scaffold(
      backgroundColor: const Color(0xfff7fbfe),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 55,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                    future: recipes.getRecipe(),
                    builder: (context, snapshot) => snapshot.data != null
                        ? _listMovie(snapshot.data as List<Recipes>)
                        : Center(child: CircularProgressIndicator()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _listMovie(List<Recipes> recipes) {
  return ListView.builder(
      itemBuilder: (context, index) => CatalogItem(Recipes: recipes[index]),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: recipes.length);
}
