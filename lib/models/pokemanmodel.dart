class Pokemon {
 final int  id;
  final String name;
  final String imageUrl;
  bool isFavorite;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isFavorite = false,
  });

 factory Pokemon.fromJson(Map<String, dynamic> json, String imageUrl) {
  return Pokemon(
    id: json['id'],
    name: json['name'],
    imageUrl: imageUrl, // Use the provided imageUrl
  );
}


  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}