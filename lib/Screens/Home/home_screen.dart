import 'package:dashfanclub/Apis/dash_home_feed_api.dart';
import 'package:dashfanclub/Apis/dash_updates_api.dart';
import 'package:dashfanclub/Constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DashUpdates dashUpdater = DashUpdates();

  List _dashUpdates = [];

  @override
  initState() {
    super.initState();
    _dashUpdates = dashUpdater.getUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: homeFeedData.length,
      itemBuilder: (context, index) {
        return FeedCard(
          profileImageUrl: homeFeedData[index].profileImageUrl,
          author: homeFeedData[index].author,
          imageUrl: homeFeedData[index].imageUrl,
          psstDescription: homeFeedData[index].postDescription,
        );
      },
    );
  }
}

class FeedCard extends StatelessWidget {
  final String profileImageUrl;
  final String author;
  final String imageUrl;
  final String psstDescription;
  const FeedCard({
    required this.profileImageUrl,
    required this.author,
    required this.imageUrl,
    required this.psstDescription,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 420,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardTopBar(
                profileImageUrl: profileImageUrl,
                author: author,
              ),
              ImageContainer(
                imageUrl: imageUrl,
                // "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
              ),
              const CardActionButtons(),
              PostDescriptionSection(
                author: author,
                postDescription: psstDescription,
                // 'Here is the content description of the post',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PostDescriptionSection extends StatelessWidget {
  final String author;
  final String postDescription;
  const PostDescriptionSection({
    required this.author,
    required this.postDescription,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      child: RichText(
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
                text: '$author: ',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
              text: postDescription,
              // ' Hello people... Look who is back? yes, the dash. Now its time to start fluttering again. Are you ready to flutter? Dive in! Now its time to start fluttering again. Are you ready to flutter? Dive in!Now its time to start fluttering again. Are you ready to flutter? Dive in!',
            ),
          ],
        ),
      ),
    );
  }
}

class CardActionButtons extends StatelessWidget {
  const CardActionButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(
                Icons.favorite_outline,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.comment_bank_outlined,
                size: 18,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.send_outlined,
                size: 18,
              )
            ],
          ),
          const Icon(
            Icons.save_alt,
            size: 20,
          ),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  const ImageContainer({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

class CardTopBar extends StatelessWidget {
  final String profileImageUrl;
  final String author;
  const CardTopBar({
    required this.profileImageUrl,
    required this.author,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 21,
                backgroundColor: secondary,
                child: CircleAvatar(
                  backgroundImage: AssetImage(profileImageUrl),
                  radius: 20,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                author,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Icon(
            Icons.more_vert,
            size: 25,
          )
        ],
      ),
    );
  }
}
