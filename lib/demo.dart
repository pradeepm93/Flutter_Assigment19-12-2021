import 'package:flutter/material.dart';
import 'package:flutter_camera_demo/screens/camera_screen.dart';
import 'package:flutter_camera_demo/swipedel.dart';
 enum SingingCharacter { male, female }

class User {
  final String username, address;

  const User(
    {
    required this.username,
    required this.address,
   
    }
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //TextEditingController is controller for editable text fields.
  //It's role is to update itself and notify listeners whenever it's associated
  //textfield changes.
  var _usernameController = new TextEditingController();
  var _addressController = new TextEditingController();
 
  SingingCharacter? character = SingingCharacter.male;
    bool value = false;
     bool value1 = false;
 

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title: new Text('DEMO'), 
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: new Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                  Padding(
                    child: new Text(
                      'Type and Pass Data',
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                      textAlign: TextAlign.center,
                      ),
                    padding: EdgeInsets.only(bottom: 20.0),
                  ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Username'),
                  controller: _usernameController,
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'address'),
                ),


SizedBox(height: 10,),
 Text("Radio Button",style:TextStyle(fontSize: 20),),
Padding(
  padding: const EdgeInsets.only(left: 50),
  child:   Row(
  
    children: [
  
      Text("Male"),
  
      Radio<SingingCharacter>(
  
              value: SingingCharacter.male,
  
              groupValue: character,
  
              onChanged: (SingingCharacter? value) {
  
                setState(() { character = value; });
  
              },
  
          ),
  
          SizedBox(width: 20,),
  
  Text('female'),
  
  Radio<SingingCharacter>(
  
              value: SingingCharacter.female,
  
              groupValue: character,
  
              onChanged: (SingingCharacter? value) {
  
                setState(() { character = value; });
  
              },
  
          ),
  
    ],
  
  ),
),
 
 Text("Check Box",style:TextStyle(fontSize: 20),),

                Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ), //SizedBox
                        Text(
                          'cricket ',
                          style: TextStyle(fontSize: 17.0),
                        ), //Text
                        SizedBox(width: 10), //SizedBox
                        /** Checkbox Widget **/
                        Checkbox(
                          value: this.value,
                          onChanged: (value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ), //Checkbox
                      ], //<Widget>[]
                    ), //Row
                     Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ), //SizedBox
                        Text(
                          'FootBall ',
                          style: TextStyle(fontSize: 17.0),
                        ), //Text
                        SizedBox(width: 10), //SizedBox
                        /** Checkbox Widget **/
                        Checkbox(
                          value: this.value1,
                          onChanged: (value1) {
                            setState(() {
                              this.value1 = value1!;
                            });
                          },
                        ), //Checkbox
                      ], //<Widget>[]
                    ), //R


                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      new RaisedButton(
                        onPressed: () {
                          // A MaterialPageRoute is a  modal route that replaces the entire screen
                          // with a platform-adaptive transition.
                          var route = new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new SecondPage(
                                  value: User(
                                          username: _usernameController.text,
                                          address: _addressController.text,
                                        
                                          )
                                          ),
                          );
                          Navigator.of(context).push(route);
                        },
                        child: new Text('Click to Pass Data'),
                      ),
                      SizedBox(width: 20,),
                       new RaisedButton(
                    onPressed: () {
                      // A MaterialPageRoute is a  modal route that replaces the entire screen
                      // with a platform-adaptive transition.
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                           CameraScreen()
                      );
                      Navigator.of(context).push(route);
                    },
                    child: new Text('Open Camara'),
                  ),
                     SizedBox(width: 20,),
                      
                    ],
                  ),

                ),
                 new RaisedButton(
                    onPressed: () {
                      // A MaterialPageRoute is a  modal route that replaces the entire screen
                      // with a platform-adaptive transition.
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        //  CameraScreen()
                        Home1()
                      );
                      Navigator.of(context).push(route);
                    },
                    child: new Text('Swipe TO Del'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final User value;

  SecondPage({ required this.value});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Second Page')),
      body: new Container(
         child: new Center(
            child: Column(
              children: <Widget>[
                Padding(
                  child: new Text(
                    'PASSED VALUES',
                    style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                    textAlign: TextAlign.center,
                    ),
                  padding: EdgeInsets.only(bottom: 20.0),
                ),
                Padding(
                  child: new Text(
                    'USERNAME : ${widget.value.username}',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                    ),
                  padding: EdgeInsets.all(10.0),
                ),
                Padding(
                  child: new Text(
                    'Address : ${widget.value.address}',
                     style: new TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                    ),
                  padding: EdgeInsets.all(10.0),
                ),
                
                 ],   ),
        ),
      ),
    );
  }
}
