import 'package:sstoktik/domain/datasources/video_post_datasource.dart';

import '../../domain/entities/video_post.dart';
import '../../shared/data/local_video_posts.dart';
import '../models/local_video_model.dart';

class LocalVideoDataSource implements VideoPostDataSource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {


   throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {

    await Future.delayed( const Duration(seconds: 2) );
    
    final List<VideoPost> newVideos = videoPosts.map(
      ( video ) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    ).toList();

    return newVideos;

  }

}