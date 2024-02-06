import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sstoktik/config/theme/app_theme.dart';
import 'package:sstoktik/domain/entities/video_post.dart';
import 'package:sstoktik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:sstoktik/infrastructure/repositories/video_post_repository_impl.dart';
import 'package:sstoktik/presentation/providers/discover_provider.dart';
import 'package:sstoktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videosPostRepository = VideoPostsRepositoryImpl(
      videoPostDataSource: LocalVideoDataSource()
    );


    return MultiProvider(
      providers: [
        ChangeNotifierProvider( 
          lazy: false,
          create: (_) => DiscoverProvider(videoPostRepository: videosPostRepository )..loadNextPage()
        ),
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen()
      ),
    );
  }
}