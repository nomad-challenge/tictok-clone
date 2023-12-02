import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynote/constants/gaps.dart';
import 'package:mynote/constants/sizes.dart';
import 'package:mynote/features/authentication/widgets/form_button.dart';
import 'package:mynote/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime initialDate = DateTime.now().add(const Duration(days: 365 * -12));
  @override
  void initState() {
    super.initState();
    _setDateField(initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _setDateField(DateTime date) {
    final String textDate = date.toString().split(" ")[0];
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  void _onNextTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (builder) => const InterestsScreen()),
        (route) => false);
  }

  void _onScafoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScafoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "When's your birthday?",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v6,
              const Text(
                "Your birthday won't be shown publicty.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
              ),
              TextField(
                controller: _birthdayController,
                enabled: false,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v16,
              FormButton(
                text: "Next",
                disabled: false,
                onTap: _onNextTap,
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              maximumDate: initialDate,
              initialDateTime: initialDate,
              onDateTimeChanged: (value) {
                _setDateField(value);
              },
            ),
          ),
        ),
      ),
    );
  }
}
