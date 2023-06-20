import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktick/presentation/providers/discover_provider.dart';
import 'package:toktick/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});
 
  @override
  Widget build(BuildContext context) {

    final discoverProvider = context.watch<DiscoverProvider>();
// otra forma es final discoverProvider = Provider.of<DiscoverProvider>(context);
    return Scaffold(
      body: discoverProvider.initialLoading ? const Center(
        child: CircularProgressIndicator(strokeWidth: 6.0,),
      )
      : VideoScrollableView(videos: discoverProvider.videos),
    );
  }
}
