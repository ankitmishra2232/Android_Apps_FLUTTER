class User{
  String name,mobile,date,email,address,pin,genders;
  User( this.name,this.email,this.date,this.genders,this.mobile,this.address,this.pin);
  User.fromJson(Map<String,dynamic> json) :
  // id=json['id'],
        name= json['name'],
        email=json['email'],
        mobile= json['mobile'],
        date= json['date'],
        address=json['address'],
        pin=json['pin'],
        genders=json['genders'];
  Map<String,dynamic> toJson()=>{
    'name':name,
    'email':email,
    'mobile':mobile,
    'date':date,
    'address':address,
    'pin':pin,
    'genders':genders
  };
}