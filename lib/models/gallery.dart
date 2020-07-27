class Gallery{
  String id;
  String userName;
  String userImage;
  String feedImage;
  String feedTime;
  String feedText;
  int like;
  

  Gallery({this.id,this.userName,this.userImage,this.feedImage, this.feedTime, this.feedText, this.like});

  Gallery.copy(Gallery from) : this(
    userName: from.userName,
    userImage: from.userImage,
    feedImage: from.feedImage,
    feedText:  from.feedText,
    feedTime: from.feedTime,
    like: from.like,
  );

  Gallery.fromJson(Map<String, dynamic> json)
  : this(
   userName: json['userName'],
   userImage: json['userImage'],
   feedImage: json['feedImage'],
   feedTime: json['feedTime'],
   feedText: json['feedText'],
   like: json['like'],
   id: json['id']
   );

   Map<String, dynamic> toJson() => {
   'userName': userName,
   'userImage': userImage,
   'feedImage': feedImage,
   'feedTime': feedTime,
   'feedText': feedText,
   'like': like,
   'id' :  id
   };
}