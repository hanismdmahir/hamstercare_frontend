class Gallery{
  String userName;
  String userImage;
  String feedImage;
  String feedTime;
  String feedText;
  String like;
  String comment;

  Gallery({this.userName,this.userImage,this.feedImage, this.feedTime, this.feedText, this.comment, this.like});

  Gallery.copy(Gallery from) : this(
    userName: from.userName,
    userImage: from.userImage,
    feedImage: from.feedImage,
    feedText:  from.feedText,
    feedTime: from.feedTime,
    like: from.like,
    comment: from.comment
  );
}