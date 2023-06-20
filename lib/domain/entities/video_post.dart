
class VideoPost {

  final String caption; //titulo del video
  final String imageUrl;
  final int likes;
  final int views;

  VideoPost({
    required this.caption, 
    required this.imageUrl, 
    this.likes =0, 
    this.views= 0});

  
}