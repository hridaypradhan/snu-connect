import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/models/event.dart';

class MoreInfoScreen extends StatelessWidget {
  static const String id = 'more_info';
  //what to pass? code + category for colour
  //final Event e;
  MoreInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20.0),
        width: 400,
        height: 700,
        padding: EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Color(0xfffdf6de), //getCategoryColor(e),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min, //what
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Event Title",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.close),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Time",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("Venue",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("People Count",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                height: 175,
                width: 350,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color(0xffffefb9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Short Description ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. (Color of card based on category)",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(10.0),
                height: 100,
                width: 350,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color(0xffffefb9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Organizer Contact Details",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        "Name",
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "SNU ID",
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Phone Number",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),

              Image.asset("assets/images/find_someone.png", width: 250), //why

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text("Need partners? Team up!"),
                  Icon(Icons.add),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color getCategoryColor(Category category) {
  switch (category) {
    case Category.sports:
      return const Color(0xfffdf6de);
    case Category.studies:
      return const Color(0xffd7e8ff);
    case Category.transport:
      return const Color(0xffffdfdf);
    case Category.events:
      return const Color(0xffb5fcff);
    case Category.lostFound:
      return const Color(0xffeeffa8);
    case Category.items:
      return const Color(0xfff6d8ff);
    case Category.errands:
      return const Color(0xffffe2c8);
  }
}
