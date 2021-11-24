import 'package:date_time_picker_widget/date_time_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snu_connect/global/constants/colors.dart';
import 'package:snu_connect/global/constants/enums.dart';
import 'package:snu_connect/global/constants/extensions.dart';
import 'package:snu_connect/global/widgets/event_card.dart';
import 'package:snu_connect/global/widgets/large_button.dart';
import 'package:snu_connect/models/end_user.dart';
import 'package:snu_connect/models/event.dart';
import 'package:snu_connect/providers/event_provider.dart';
import 'package:snu_connect/screens/base/base_screen.dart';
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
  DateTime _selectedDateTime = DateTime.now();
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
    var eventProvider = Provider.of<EventProvider>(context);
    Divider divider = const Divider(thickness: 1);
    SizedBox thin = const SizedBox(height: 15.0);

    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 45.0),
      child: SingleChildScrollView(
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
              height: size.width * 0.4,
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
            DateTimePicker(
              datePickerTitle: 'Date',
              startDate: DateTime.now(),
              endDate: DateTime.now().add(
                const Duration(days: 10),
              ),
              type: DateTimePickerType.Date,
              onDateChanged: (newDate) {
                _selectedDateTime = _selectedDateTime.copyWith(
                  day: newDate.day,
                  month: newDate.month,
                  year: newDate.year,
                );
              },
            ),
            DateTimePicker(
              timePickerTitle: 'Time',
              timeInterval: const Duration(minutes: 15),
              type: DateTimePickerType.Time,
              onTimeChanged: (newTime) {
                _selectedDateTime = _selectedDateTime.copyWith(
                  hour: newTime.hour,
                  minute: newTime.minute,
                );
              },
            ),
            divider,
            thin,
            LargeButton(
              onPressed: () {
                Event newEvent = Event(
                  name: _eventNameController?.text ?? 'N/A',
                  description: _descriptionController?.text ?? 'N/A',
                  peopleCount: 1,
                  venue: _venueController?.text ?? 'N/A',
                  host: EndUser.fromAuth(),
                  maxPeople: eventProvider.peopleCount,
                  category: eventProvider.selectedCategory,
                  dateTime: _selectedDateTime,
                );
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    insetPadding: const EdgeInsets.all(10.0),
                    title: const Text(
                      'Preview',
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            color: primaryPink,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          eventProvider.uploadEvent(newEvent).then(
                                (value) => Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  BaseScreen.id,
                                  (route) => false,
                                ),
                              );
                        },
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryPink,
                          ),
                        ),
                      ),
                    ],
                    content: SizedBox(
                      height: size.height * 0.32,
                      width: size.width,
                      child: EventCard(
                        event: newEvent,
                        isPreview: true,
                      ),
                    ),
                  ),
                );
                // eventProvider.clearFields();
                // _eventNameController?.clear();
                // _descriptionController?.clear();
                // _venueController?.clear();
              },
              text: 'CREATE EVENT',
            ),
          ],
        ),
      ),
    );
  }
}
