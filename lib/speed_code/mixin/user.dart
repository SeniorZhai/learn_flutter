class User {
  String name;
  String avatar;
  User({this.name}) {
    this.avatar = 'https://avatars.dicebear.com/4.1/api/human/$name.svg';
  }
}
