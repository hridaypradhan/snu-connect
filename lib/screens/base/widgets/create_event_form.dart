import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/screens/base/widgets/category_card.dart';
import 'package:snu_connect/screens/base/widgets/description_field.dart';
import 'package:snu_connect/screens/base/widgets/event_name_field.dart';
import 'package:snu_connect/screens/base/widgets/person_counter.dart';
import 'package:snu_connect/screens/base/widgets/venue_field.dart';

class CreateEventForm extends StatefulWidget {
  const CreateEventForm({Key? key}) : super(key: key);

  @override
  State<CreateEventForm> createState() => _CreateEventFormState();
}

class _CreateEventFormState extends State<CreateEventForm> {
  final List<Category> _categories = [
    Category.errands,
    Category.events,
    Category.items,
    Category.lostFound,
    Category.sports,
    Category.studies,
    Category.transport,
  ];
  TextEditingController? _venueController,
      _eventNameController,
      _descriptionController;
  @override
  void initState() {
    super.initState();
    _venueController = TextEditingController();
    _eventNameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _venueController?.dispose();
    _eventNameController?.dispose();
    _descriptionController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Divider divider = const Divider(thickness: 1);
    SizedBox thin = const SizedBox(height: 10.0);

    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          const Text(
            'Create Event',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          divider,
          thin,
          const Text('Category'),
          thin,
          SizedBox(
            height: size.width * 0.27,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                _categories.length,
                (index) => CategoryCard(
                  category: _categories[index],
                ),
              ),
            ),
          ),
          thin,
          divider,
          thin,
          EventNameField(
            controller: _eventNameController,
          ),
          thin,
          VenueField(
            controller: _venueController,
          ),
          thin,
          DescriptionField(
            controller: _descriptionController,
          ),
          thin,
          divider,
          thin,
          const Text('People Count'),
          thin,
          const PersonCounter(),
          thin,
          divider,
          thin,
        ],
      ),
    );
  }
}
