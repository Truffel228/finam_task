import 'package:finam_task/constants.dart';
import 'package:finam_task/data/repositories/reddit_repo/reddit_repo_interface.dart';
import 'package:finam_task/locator.dart';
import 'package:finam_task/screens/main/bloc/main_bloc.dart';
import 'package:finam_task/screens/main/widgets/reddit_post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(
        redditRepo: locator.get<RedditRepoInterface>(),
      )..add(MainFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.lightGreen,
          centerTitle: true,
          title: const Text('Finam Task'),
        ),
        body: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
            if (state is MainErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ошибка'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.mainPageState.loading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppConstants.lightGreen,
                ),
              );
            }
            return RefreshIndicator(
              color: AppConstants.lightGreen,
              onRefresh: () async {
                context.read<MainBloc>().add(
                      MainRefreshEvent(),
                    );
              },
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                itemCount: state.mainPageState.redditPosts.length,
                itemBuilder: (context, index) => RedditPostItem(
                  redditPost: state.mainPageState.redditPosts[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
