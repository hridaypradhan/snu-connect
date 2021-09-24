import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/models/event.dart';
import 'package:snu_connect/models/user.dart';

class MoreInfoScreen extends StatelessWidget {
  static const String id = 'more_info';
  final Event e = Event(
    name: "Name",
    category: Category.sports,
    dateTime: DateTime.now(),
    host: User(
      name: "ABC",
      email: "abc223",
      phone: "0009012",
    ),
    venue: "Lib",
  );
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
          color: getCategoryColor(e.category),
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
                    e.name,
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
                  Text(e.dateTime.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(e.venue,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("People Count", //e.peoplecount or whatever rqd
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
                  color: getCategoryCode(e.category),
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
                  color: getCategoryCode(e.category),
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
                        e.host.name,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        e.host.email,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        e.host.phone,
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

Color getCategoryCode(Category category) {
  //update darker colors
  switch (category) {
    case Category.sports:
      return const Color(0xffffefb9);
    case Category.studies:
      return const Color(0xff8dbdff);
    case Category.transport:
      return const Color(0xffffb3ce);
    case Category.events:
      return const Color(0xffbcff87);
    case Category.lostFound:
      return const Color(0xffeeffa8);
    case Category.items:
      return const Color(0xffec91ff);
    case Category.errands:
      return const Color(0xffffe2c8);
  }
}

Image getCategoryImage(Category category) {
  //change addresses for variety of images
  switch (category) {
    case Category.sports:
      return Image.asset("assets/images/find_someone.png", width: 250);
    case Category.studies:
      return Image.asset("assets/images/find_someone.png", width: 250);
    case Category.transport:
      return Image.asset("assets/images/find_someone.png", width: 250);
    case Category.events:
      return Image.asset("assets/images/find_someone.png", width: 250);
    case Category.lostFound:
      return Image.asset("assets/images/find_someone.png", width: 250);
    case Category.items:
      return Image.asset("assets/images/find_someone.png", width: 250);
    case Category.errands:
      return Image.asset("assets/images/find_someone.png", width: 250);
  }
}
