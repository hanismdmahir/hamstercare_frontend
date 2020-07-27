class Hamster {
  String id;
  String username;
  String name;
  String photo;
  String gender;
  String bod;
  String color;
  String desc;
  String breed;
  String ni;


  Hamster({this.id,this.username,this.name, this.photo, this.bod, this.breed, this.color, this.desc,this.gender,this.ni});

  Hamster.fromJson(Map<String, dynamic> json)
  : this(
    id: json['id'],
    username: json['username'],
    name: json['name'],
    photo: json['photo'],
    gender: json['gender'],
    bod: json['bod'],
    color: json['color'],
    desc: json['desc'],
    breed: json['breed'],
    ni: json['ni'],

  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'name': name,
    'photo': photo,
    'gender': gender,
    'bod': bod,
    'color': color,
    'desc': desc,
    'breed': breed,
    'ni': ni,
  };
}