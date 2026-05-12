// ignore_for_file: file_names

class ContentModel2 {
  String image;
  String title;
  String episodes;
  double rating;

  ContentModel2({
    required this.image,
    required this.title,
    required this.episodes,
    required this.rating,
  });
}

List<ContentModel2> contentList2 = [
  ContentModel2(
    image: "assets/images/films.png",
    title: "Avengers",
    episodes: "10 Episodes",
    rating: 4.5,
  ),
  ContentModel2(
    image: "assets/images/films.png",
    title: "Avengers",
    episodes: "10 Episodes",
    rating: 4.5,
  ),
  ContentModel2(
    image: "assets/images/films.png",
    title: "Avengers",
    episodes: "10 Episodes",
    rating: 4.5,
  ),
];
