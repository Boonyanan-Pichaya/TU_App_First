import 'package:first_app/components/choice_card.dart';
import 'package:first_app/models/userpref_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormTwoPage extends StatefulWidget {
  const FormTwoPage({super.key});

  @override
  State<FormTwoPage> createState() => _FormTwoPageState();
}

class _FormTwoPageState extends State<FormTwoPage> {
  bool isMember = false;
  bool isAllYouCanEat = false;
  int noodleType = 0;

  @override
  void initState() {
    super.initState();

    var userPref = context.read<UserPrefernceModel>();

    isMember = userPref.getIsMember;
    isAllYouCanEat = userPref.getIsAllYouCanEat;
    noodleType = userPref.getNoodleType;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Two Page')),

      body: Column(
        children: [
          SwitchListTile(
            activeThumbColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Membership'),
            controlAffinity: ListTileControlAffinity.platform,
            value: isMember,
            onChanged: (bool value) {
              setState(() {
                isMember = value;
                context.read<UserPrefernceModel>().isMember = isMember;
              });
            },
          ),
          CheckboxListTile(
            activeColor: Colors.red,
            title: const Text('All You Can Eat'),
            subtitle: const Text('You can eat as much as you want'),
            controlAffinity: ListTileControlAffinity.platform,
            value: isAllYouCanEat,
            onChanged: (bool? value) {
              setState(() {
                isAllYouCanEat = value ?? false;
                context.read<UserPrefernceModel>().isAllYouCanEat =
                    isAllYouCanEat;
              });
            },
          ),
          choiceCard(
            choiceData: ChoiceData(
              title: 'Ja Kin Sen Arai?',
              choices: ['Sen Yai', 'Sen Lek', 'Mama', 'Woon Sen'],
              groupValue: noodleType,
              onChanged: (int newValue) {
                setState(() {
                  noodleType = newValue;
                  context.read<UserPrefernceModel>().noodleType = noodleType;
                });
              },
            ),
          ),
          Text('Membership : $isMember'),
          Text('Kin Tok Yain : $isAllYouCanEat'),
          Text('Kin Sen : $noodleType'),
        ],
      ),
    );
  }
}
