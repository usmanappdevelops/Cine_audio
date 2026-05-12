class ContentModel1 {
  String image;
  String title;
  String episodes;
  double rating;

  ContentModel1({
    required this.image,
    required this.title,
    required this.episodes,
    required this.rating,
  });
}

List<ContentModel1> contentList1 = [
  ContentModel1(
    image: "assets/images/podcast.png",
    title: "Sunday Podcast",
    episodes: "10 Episodes",
    rating: 4.5,
  ),
  ContentModel1(
    image: "assets/images/podcast.png",
    title: "Sunday Podcast",
    episodes: "10 Episodes",
    rating: 4.5,
  ),
  ContentModel1(
    image: "assets/images/podcast.png",
    title: "Sunday Podcast",
    episodes: "10 Episodes",
    rating: 4.5,
  ),
];
