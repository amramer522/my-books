class Book {
  final int id;
  final String name, description, image;
  bool isFav;

  Book(
      {required this.id,
      required this.name,
      required this.isFav,
      required this.description,
      required this.image});

  void changeFav() {
    isFav = !isFav;
  }
}
