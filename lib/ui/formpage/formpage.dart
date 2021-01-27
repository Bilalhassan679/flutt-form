import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

//
enum SingingCharacter { AMERICAN, ENGLAND, DUBAI, NONE }

//
class _FormPageState extends State<FormPage> {
  SingingCharacter _character = SingingCharacter.NONE;
  bool chickenburgerVal = false;
  bool beefburgerVal = false;
  bool zingerburgerVal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RATING FORM"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Full Name Please"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Email Please"),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "NUMBER"),
              ),
              // RaisedButton(child: Text('SUBMIT'), onPressed: () {}),
              SizedBox(height: 20.0),
              Wrap(
                children: [
                  Expanded(
                    // maxLines: 10,
                    child: Text(
                      "Famous fast food restaurant company “Burger King” belongs to which Country?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              // Expanded(
              //   child: Container(
              //     decoration: BoxDecoration(
              //       border: Border.all(color: Colors.green, width: 2.0),
              //     ),
              //     child: Text(
              //       "",
              //       maxLines: 10,
              //       style: Theme.of(context)
              //           .primaryTextTheme
              //           .caption
              //           .copyWith(color: Colors.black),
              //       overflow: TextOverflow.ellipsis,
              //     ),
              //   ),
              // ),
              // Text(
              //   'Famous fast food restaurant company “Burger King” belongs to which Country?',
              //   // textAlign: TextAlign.center,
              //   overflow: TextOverflow.ellipsis,
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              Wrap(
                children: [
                  ListTile(
                    title: const Text('American'),
                    leading: Radio(
                      value: SingingCharacter.AMERICAN,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('England'),
                    leading: Radio(
                      value: SingingCharacter.ENGLAND,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Dubai'),
                    leading: Radio(
                      value: SingingCharacter.DUBAI,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('None'),
                    leading: Radio(
                      value: SingingCharacter.NONE,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ],
              ),

              Wrap(
                children: [
                  Expanded(
                    // maxLines: 10,
                    child: Text(
                      "Which burger you like the most to eat ? ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // [Monday] checkbox
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("CHICKEN"),
                      Checkbox(
                        value: chickenburgerVal,
                        onChanged: (bool value) {
                          setState(() {
                            chickenburgerVal = value;
                          });
                        },
                      ),
                    ],
                  ),
                  // [Tuesday] checkbox
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("BEEF"),
                      Checkbox(
                        value: beefburgerVal,
                        onChanged: (bool value) {
                          setState(() {
                            beefburgerVal = value;
                          });
                        },
                      ),
                    ],
                  ),
                  // [Wednesday] checkbox
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("ZINGER"),
                      Checkbox(
                        value: zingerburgerVal,
                        onChanged: (bool value) {
                          setState(() {
                            zingerburgerVal = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Wrap(
                children: [
                  Expanded(
                    // maxLines: 10,
                    child: Text(
                      "HOW MUCH YOU LIKE BURGER PLEASE RATE",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothStarRating(),
                  RaisedButton(
                    onPressed: () {},
                    child: Text("SUBMIT"),
                    color: Colors.blueAccent,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
