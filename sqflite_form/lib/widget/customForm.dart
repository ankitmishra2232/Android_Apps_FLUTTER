import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Database/db_helper.dart';
import '../model/model.dart';
import 'cards.dart';

enum Genders{Male,Female,Others}
class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  CustomFormState createState() {
    return CustomFormState();
  }

}
// Create a corresponding State class. This class holds data related to the form.
class CustomFormState extends State<CustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  // final File file=File('user.json');
  final formKey = GlobalKey<FormState>();
  TextEditingController _date = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pin = TextEditingController();
  TextEditingController _add = TextEditingController();
  Genders? _genders;
  int Count=0;

  get textController => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
        padding: const EdgeInsets.only(left: 20,right: 10,top: 20),
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    validator: (name) {
                      if (isNameValid(name)) return null;
                      else
                        return 'Enter a valid name';
                    },
                    keyboardType: TextInputType.name,
                    controller: _name,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your name',
                      labelText: 'Name',
                    ),
                  ),
                  TextFormField(
                    validator: (phone) {
                      if (isPhoneValid(phone)) return null;
                      else
                        return 'Enter a valid mobile number';
                    },
                    keyboardType: TextInputType.phone,
                    controller: _phone,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter a Mobile number',
                      labelText: 'Mobile',
                    ),

                  ),

                  TextFormField(
                    validator: (date) {
                      if (isDateValid(date)) return null;
                      else
                        return 'Enter a valid date';
                    },
                    keyboardType: TextInputType.datetime,
                    controller: _date,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter your date of birth',
                      labelText: 'Dob',
                    ),
                    onTap: () async{
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now());
                      if(pickeddate!=null){
                        setState((){
                          _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    },
                  ),
                  TextFormField(
                    validator: (email) {
                      if (isEmailValid(email)) return null;
                      else
                        return 'Enter a valid email address';
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      hintText: 'Enter Your E-Mail',
                      labelText: 'E-mail',
                    ),

                  ),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    controller: _add,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.location_city),
                      hintText: 'Enter Your Address',
                      labelText: 'Address',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _pin,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.location_on),
                      hintText: 'Enter Your ZIP code',
                      labelText: 'Postel Code',
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<Genders>(
                            contentPadding: EdgeInsets.all(0.0),
                            value: Genders.Male,
                            groupValue: _genders,
                            title: Text(Genders.Male.name),
                            onChanged: (val){
                              setState((){
                                _genders = val;
                              });
                            }),
                      ),
                      Expanded(
                        child: RadioListTile<Genders>(
                            contentPadding: EdgeInsets.all(0.0),
                            value: Genders.Female,
                            groupValue: _genders,
                            title: Text(Genders.Female.name),
                            onChanged: (val){
                              setState((){
                                _genders = val;
                              });
                            }),
                      ),
                      Expanded(
                        child: RadioListTile<Genders>(
                            contentPadding: EdgeInsets.all(0.0),
                            value: Genders.Others,
                            groupValue: _genders,
                            title: Text(Genders.Others.name),
                            onChanged: (val){
                              setState((){
                                _genders = val;
                              });
                            }),),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 120.0, top: 40.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if(formKey.currentState!.validate()){
                            // formKey.currentState!.save();
                            // print(_name);
                            // print(_genders);
                            // Count++;
                            await DatabaseHelper.instance.add(
                                  User(name: _name.text,
                                    genders: _genders.toString(),
                                    mobile: _phone.text,
                                    date: _date.text,
                                    pin: _pin.text,
                                    address: _add.text,
                                    email: _email.text,

                                  ),
                            );
                            setState((){
                              textController.clear();
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted")));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue, //button's fill color
                          onPrimary: Colors.black, //specify the color of the button's text and icons as well as the overlay colors used to indicate the hover, focus, and pressed states
                          // onSurface: Colors.black, //specify the button's disabled text, icon, and fill color
                          shadowColor: Colors.red, //specify the button's elevation color
                          elevation: 4.0, //buttons Material shadow
                          textStyle: TextStyle(fontFamily: 'roboto',fontWeight: FontWeight.w800,fontSize: 25), //specify the button's text TextStyle
                        ),
                        child: Text('Submit'),
                      )
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 100.0, top: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => cards(),
                          ));
                          // Navigator.of(context).push(
                          //     // MaterialPageRoute (
                          //     // // builder: (context) => const CustomCards()
                          //     // )
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue, //button's fill color
                          onPrimary: Colors.black, //specify the color of the button's text and icons as well as the overlay colors used to indicate the hover, focus, and pressed states
                          // onSurface: Colors.black, //specify the button's disabled text, icon, and fill color
                          shadowColor: Colors.red, //specify the button's elevation color
                          elevation: 4.0, //buttons Material shadow
                          textStyle: TextStyle(fontFamily: 'roboto',fontWeight: FontWeight.w800,fontSize: 25), //specify the button's text TextStyle
                        ),
                        child: Text('View Cards'),
                      )
                  )
                ],
              ),
            )

        )
    );

  }

  bool isEmailValid(String? email) {
    RegExp regex = new RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(email!);
  }

  bool isNameValid(String? name) {
    RegExp regex = new RegExp(r'^[A-Za-z][A-Za-z]{2,29}$');
    return regex.hasMatch(name!);
  }

  bool isPhoneValid(String? phone) {
    RegExp regex = new RegExp(r'^[1-9]{1}[0-9]{9}$');
    return regex.hasMatch(phone!);
  }
  bool isDateValid(String? date) {
    RegExp regex = new RegExp(r'');
    return regex.hasMatch(date!);
  }

}