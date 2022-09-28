class User {
  final int? id;
  final String name,mobile,date,email,address,pin,genders;
  User({this.id,
    required this.name,
    required this.mobile,
    required this.email,
    required this.date,
    required this.genders,
    required this.address,
    required this.pin});

  factory User.fromMap(Map<String,dynamic> json) => new User(
      id:json['id'],
      name: json['name'],
      email:json['email'],
      mobile: json['mobile'],
      date: json['date'],
      address:json['address'],
      pin:json['pin'],
      genders:json['genders']
  );
  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'name':name,
      'email':email,
      'mobile':mobile,
      'date':date,
      'address':address,
      'pin':pin,
      'genders':genders
    };
  }
}