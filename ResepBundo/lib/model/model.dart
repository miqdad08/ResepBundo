
class Recipes {
  Recipes({
    required this.title,
    required this.image,
    required this.rating,
    required this.totalTime,
    required this.desc,
    required this.ingredienst,
  
  });

  final String title;
  final String image;
  final String rating;
  final String totalTime;
  final String desc;
  final String ingredienst;

  factory Recipes.fromJson(Map<String, dynamic> json) => Recipes(
    title: json["name"] ?? 'Fight Club',
    image: json["images"][0]['hostedLargeUrl'] as String,
    rating: json["rating"].toString() ?? "8.4",
    totalTime: json["totalTime"] ?? '1999-10-15',
    ingredienst: "1/4 kg daging ayam,\n saya bagian paha 2-3 ssm tepung beras,\n larutkan dengan sedikit air\n Tusukan sate 2-3\n sdm minyak goreng untuk menumis",
    desc: "1.Cuci bersih ayam, kemudian potong dadu sekitar 1,5cm. Kemudian tusukkan pada tusukan sate, saya 4potong ayam pertusuk.\n2.Campur kecap manis, kecap asin dan garlic powder. Aduk rata. Rendam sate dengan bahan kecap, kemudian bakar hingga matang.sisihkan.,\n3.Haluskan semua bahan bumbu halus untuk saus. Saya menggunakan blender. Kemudian panaskan minyak goreng, tumis bumbu halus bersama daun salam dan serai. Tumis sampai wangi.\n4. Bumbui dengan parutan pala, garam dan gula. Aduk rata kemudian tuang larutan tepung beras. Masak hingga bumbu matang dan mengental. Matikan kompor.\n 5.Tata sate ayam dan potongan lontong dalam wadah saji, kemudian siram dengan saus bumbunya dan taburi bawang merah goreng. Siap disajikan.",
  );

  static List<Recipes> recipeFromSnapshot(List snapshot){
    return snapshot.map((data) {
      return Recipes.fromJson(data);
      }).toList();
  }
    @override
  String toString(){
    return 'Recipe {title: $title, image: $image, rating: $rating, totalTime: $totalTime}';
  }

  
}