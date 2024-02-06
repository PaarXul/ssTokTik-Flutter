import 'package:flutter/material.dart';
import 'package:sstoktik/domain/entities/video_post.dart';
import 'package:sstoktik/infrastructure/models/local_video_model.dart';

import 'package:sstoktik/shared/data/local_video_posts.dart';

import '../../domain/repositories/video_posts_repository.dart';



class DiscoverProvider extends ChangeNotifier {


    final VideoPostRepository videoPostRepository;


  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});


  Future<void> loadNextPage() async {

    // await Future.delayed( const Duration(seconds: 2) );

   // final List<VideoPost> newVideos = videoPosts.map(
   //   ( video ) => LocalVideoModel.fromJson(video).toVideoPostEntity()
   // ).toList();

    final newVideos = await videoPostRepository.getTrendingVideosByPage( 1 );


    videos.addAll( newVideos );
    initialLoading = false;
    notifyListeners();
  }


}