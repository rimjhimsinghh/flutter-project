class User {
  final String
      uid; //property that doesn't change as user navigates between screens
  User({this.uid}); //  set property in Constructor (named parameters)
}

//when new instance of User class created (pass UID property)
class UserData {
  final String uid;
  final String name;
  final String sugars;
  final int strength;
  UserData({this.uid, this.sugars, this.strength, this.name});
}
