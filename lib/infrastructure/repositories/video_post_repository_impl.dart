
import 'package:sstoktik/domain/entities/video_post.dart';
import '../../domain/datasources/video_post_datasource.dart';
import '../../domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {

  final VideoPostDataSource videoPostDataSource;

  VideoPostsRepositoryImpl(
      {
        required this.videoPostDataSource

      });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostDataSource.getTrendingVideosByPage(page);
  }

}