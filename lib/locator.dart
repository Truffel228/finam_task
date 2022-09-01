import 'package:dio/dio.dart';
import 'package:finam_task/data/repositories/reddit_repo/reddit_repo.dart';
import 'package:finam_task/data/repositories/reddit_repo/reddit_repo_interface.dart';
import 'package:finam_task/data/services/reddit_service/reddit_service.dart';
import 'package:finam_task/data/services/reddit_service/reddit_service_interface.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(baseUrl: 'https://www.reddit.com'),
    ),
  );
  locator.registerLazySingleton<RedditServiceInterface>(
    () => RedditService(
      locator.get<Dio>(),
    ),
  );
  locator.registerLazySingleton<RedditRepoInterface>(
    () => RedditRepo(
      locator.get<RedditServiceInterface>(),
    ),
  );
}
