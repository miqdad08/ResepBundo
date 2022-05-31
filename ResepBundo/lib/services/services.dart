import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resep_mama/model/model.dart';

String baseUrl = "https://yummly2.p.rapidapi.com/";


class RecipeApi {
  Future<List<Recipes>?> getRecipe() async {
    var url = Uri.https('yummly2.p.rapidapi.com', "/feeds/list",
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(url, headers: {
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "X-RapidAPI-Key": "a9f4929532mshbe5b22442526c76p150a6djsn45c33a04cb5c",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i["content"]["details"]);
    }

    return Recipes.recipeFromSnapshot(_temp);
  }
}
