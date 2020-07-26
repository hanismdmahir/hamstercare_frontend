class Gallery {
  String userName;
  String userImage;
  String feedImage;
  String feedTime;
  String feedText;
  int like;
  //String comment;

  Gallery(
      {this.userName,
      this.userImage,
      this.feedImage,
      this.feedTime,
      this.feedText,
      this.like});

  Gallery.copy(Gallery from)
      : this(
          userName: from.userName,
          userImage: from.userImage,
          feedImage: from.feedImage,
          feedText: from.feedText,
          feedTime: from.feedTime,
          like: from.like,
          //comment: from.comment
        );

  Gallery.fromJson(Map<String, dynamic> json)
      : this(
          userName: json['userName'],
          userImage: json['userImage'],
          feedImage: json['feedImage'],
          feedTime: json['feedTime'],
          feedText: json['feedText'],
          like: json['like'],
        );
}
