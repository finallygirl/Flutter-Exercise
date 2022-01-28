int counter = 1;

class MovieItem {
  int? rank;
  String? imageURL;
  String? name;
  String? year;
  String? rating;
  String? genre;
  String? originalName;
  String? description;
  String? country;

  MovieItem.fromMap(Map<String, dynamic> json) {
    this.rank = counter++;
    this.imageURL = json["data"][0]["poster"];
    this.name = json["data"][0]["name"];
    this.year = json["year"];
    this.rating = json["doubanRating"];
    this.genre = json["data"][0]["genre"];
    this.originalName = json["originalName"];
    this.description = json["data"][0]["description"];
    this.country = json["data"][0]["country"];
  }
}
