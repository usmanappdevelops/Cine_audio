// ignore_for_file: file_names

class ContentModel {
  final String image;
  final String title;
  final String episodes;
  final double rating;

  ContentModel({
    required this.image,
    required this.title,
    required this.episodes,
    required this.rating,
  });
}

List<ContentModel> contentList = [
  ContentModel(
    image: "assets/images/movie1.png",
    title: "Disney Princess",
    episodes: "10 Episodes",
    rating: 4.5,
  ),
  ContentModel(
    image: "assets/images/movie1.png",
    title: "Disney Princess",
    episodes: "10 Episodes",
    rating: 4.5,
  ),
  ContentModel(
    image: "assets/images/movie1.png",
    title: "Disney Princess",
    episodes: "10 Episodes",
    rating: 4.5,
  ),
];
