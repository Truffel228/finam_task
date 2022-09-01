import 'package:finam_task/constants.dart';
import 'package:finam_task/data/models/reddit_post/reddit_post.dart';
import 'package:flutter/material.dart';

class DetailedScreenArguments {
  const DetailedScreenArguments({
    required this.redditPost,
  });
  final RedditPost redditPost;
}

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is! DetailedScreenArguments) {
      Navigator.of(context).pop();
    }
    arguments = arguments as DetailedScreenArguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.lightGreen,
        centerTitle: true,
        title: const Text('Reddit Post'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Image.network(
              arguments.redditPost.data.thumbnail,
              width: double.infinity,
              height: 200,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox.shrink(),
            ),
            const SizedBox(height: 20),
            Text(
              arguments.redditPost.data.selftext.isNotEmpty
                  ? arguments.redditPost.data.selftext
                  : 'There is no text for this post',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.arrow_upward_rounded,
                  color: AppConstants.lightGreen,
                ),
                Text(
                  '${arguments.redditPost.data.ups}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
