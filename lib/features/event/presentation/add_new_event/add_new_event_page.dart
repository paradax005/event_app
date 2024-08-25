import 'package:event_app/features/login/presentation/widgets/text_form_bloc/login_text_form_bloc.dart';
import 'package:event_app/global/theme/theme.dart';
import 'package:event_app/global/utils/media_res.dart';
import 'package:event_app/global/views/widgets/common_date_picker/common_date_picker_bloc.dart';
import 'package:event_app/global/views/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddNewEventPage extends StatefulWidget {
  const AddNewEventPage({super.key});

  @override
  State<AddNewEventPage> createState() => _AddNewEventPageState();
}

class _AddNewEventPageState extends State<AddNewEventPage> {
  late TextEditingController eventNameController;
  late TextEditingController eventDateController;
  late TextEditingController eventLocationController;
  late TextEditingController eventPriceController;
  late TextEditingController eventAvailableTicketController;
  late TextEditingController eventDescriptionController;

  @override
  void initState() {
    eventNameController = TextEditingController();
    eventDateController = TextEditingController();
    eventLocationController = TextEditingController();
    eventPriceController = TextEditingController();
    eventAvailableTicketController = TextEditingController();
    eventDescriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    eventNameController.dispose();
    eventDateController.dispose();
    eventLocationController.dispose();
    eventPriceController.dispose();
    eventAvailableTicketController.dispose();
    eventDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Add New Event',
          style: theme.textTheme.displaySmall,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginTextFormBloc(
                  hint: 'e.g, Coachella',
                  controller: eventNameController,
                  title: 'Event Name',
                ),
                CommonDatePickerBloc(
                  hint: 'Select Event Date',
                  controller: eventDateController,
                  title: 'Date',
                ),
                LoginTextFormBloc(
                  hint: 'Select event location',
                  controller: eventLocationController,
                  title: 'Event Location',
                  suffixIcon: SvgPicture.asset(
                    MediaRes.locationIcon,
                  ),
                ),
                LoginTextFormBloc(
                  hint: 'Enter Price per ticket',
                  controller: eventNameController,
                  title: 'Event Price',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    child: Text(
                      'TND',
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: descriptionGreyColor,
                      ),
                    ),
                  ),
                ),
                LoginTextFormBloc(
                  hint: 'Number of tickets available',
                  controller: eventAvailableTicketController,
                  title: 'Available Tickets',
                ),
                LoginTextFormBloc(
                  hint: 'Event description',
                  controller: eventDescriptionController,
                  title: 'Description',
                ),
                Text(
                  'Event Cover',
                  style: theme.textTheme.displaySmall,
                ),
                Container(
                  height: 160,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: descriptionGreyColor.withOpacity(.5),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.grey.withOpacity(.14),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      MediaRes.uploadIcon,
                      height: 42,
                      color: appPrimaryColor,
                    ),
                  ),
                ),
                GlobalButton(
                  textContent: 'Create Event',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
