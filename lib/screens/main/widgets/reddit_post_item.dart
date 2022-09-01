import 'package:finam_task/constants.dart';
import 'package:finam_task/data/models/reddit_post/reddit_post.dart';
import 'package:finam_task/routes.dart';
import 'package:finam_task/screens/detailed/detailed_screen.dart';
import 'package:flutter/material.dart';

class RedditPostItem extends StatelessWidget {
  const RedditPostItem({
    Key? key,
    required this.redditPost,
  }) : super(key: key);
  final RedditPost redditPost;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        Routes.detailed,
        arguments: DetailedScreenArguments(
          redditPost: redditPost,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(5),
          color: AppConstants.lightGreen,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox.square(
                dimension: 100,
                child: Image.network(
                  redditPost.data.thumbnail,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox.shrink(),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  redditPost.data.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
