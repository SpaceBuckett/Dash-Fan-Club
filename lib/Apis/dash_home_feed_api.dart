class HomeFeedData {
  final String profileImageUrl;
  final String author;
  final String imageUrl;
  final String postDescription;

  HomeFeedData({
    required this.profileImageUrl,
    required this.author,
    required this.imageUrl,
    required this.postDescription,
  });
}

List<HomeFeedData> homeFeedData = [
  HomeFeedData(
    profileImageUrl: 'assets/dash.png',
    author: 'Dash',
    imageUrl: "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
    postDescription:
        "Hey y'all, this is Dash here! I'm finally back from vacation and ready to get Fluttering again!",
  ),
  HomeFeedData(
    profileImageUrl: 'assets/rocket.jpg',
    author: 'SpaceBucket',
    imageUrl:
        "https://docs.flutter.dev/assets/images/dash/dash-conference-swag.jpg",
    postDescription:
        "Y'all, I've found the Dash plushie warehouse. No one tell Shams that I'm here... ",
  ),
  HomeFeedData(
      profileImageUrl: 'assets/man.jpg',
      author: 'Shehzad Khan',
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3UhxpYyfIUnEALy6DvOfGX0y-wCo1TbBy7Q&usqp=CAU",
      postDescription:
          "This is my very really super long comment that is going to need to wrap around my name and then keep going on the next row. They’re two separate text fields because I want to style them differently."),
  HomeFeedData(
    profileImageUrl: 'assets/woman.jpg',
    author: 'Danish Ali',
    imageUrl: "https://docs.flutter.dev/assets/images/dash/ShamsDashJacket.png",
    postDescription:
        "Hey y'all, this is Dash here! I'm finally back from vacation and ready to get Fluttering again!",
  ),
];
