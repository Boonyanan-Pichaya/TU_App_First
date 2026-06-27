import 'package:first_app/models/userpref_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoosecardPage extends StatefulWidget {
  const ChoosecardPage({super.key});

  @override
  State<ChoosecardPage> createState() => _ChoosecardPageState();
}

class _ChoosecardPageState extends State<ChoosecardPage> {
  final List<dynamic> nameList = const [
    [
      'Pichaya',
      '1997-04-17',
      'https://archive.smashing.media/assets/344dbf88-fdf9-42bb-adb4-46f01eedd629/68dd54ca-60cf-4ef7-898b-26d7cbe48ec7/10-dithering-opt.jpg',
    ],
    [
      'Jane Smith',
      '1992-02-02',
      'https://archive.smashing.media/assets/344dbf88-fdf9-42bb-adb4-46f01eedd629/68dd54ca-60cf-4ef7-898b-26d7cbe48ec7/10-dithering-opt.jpg',
    ],
    [
      'Alice Johnson',
      '1995-03-03',
      'https://archive.smashing.media/assets/344dbf88-fdf9-42bb-adb4-46f01eedd629/68dd54ca-60cf-4ef7-898b-26d7cbe48ec7/10-dithering-opt.jpg',
    ],
  ];

  String _chooseName = '';
  String _chooseName2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Choose Card Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Consumer<UserPrefernceModel>(
            builder: (context, value, child) {
              return Text('Membership: ${value.getIsMember}');
            },
          ),

          ElevatedButton(
            child: Text('Choose Name Card - $_chooseName'),
            onPressed: () async {
              String result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CardListPage(nameList: nameList),
                ),
              );
              setState(() {
                _chooseName = result;
              });
            },
          ),

          ElevatedButton(
            child: Text('Choose Name Card - $_chooseName2'),
            onPressed: () async {
              String result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CardListPage(nameList: nameList),
                ),
              );
              setState(() {
                _chooseName2 = result;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CardListPage extends StatelessWidget {
  const CardListPage({super.key, required this.nameList});

  final List<dynamic> nameList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Select Name Card Page'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: nameList.length,
        itemBuilder: (context, index) {
          return NameCard(
            data: NameCardData(
              name: nameList[index][0],
              dob: nameList[index][1],
              imageUrl: nameList[index][2],
            ),
          );
        },
      ),
    );
  }
}

class NameCard extends StatelessWidget {
  const NameCard({super.key, required this.data});

  final NameCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.inversePrimary),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 150.0, child: Image.network(data.imageUrl)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${data.name}'),
              Text('DOB: ${data.dob}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, data.name);
                },
                child: Text('Select'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NameCardData {
  const NameCardData({
    required this.name,
    required this.dob,
    required this.imageUrl,
  });
  final String name;
  final String dob;
  final String imageUrl;
}
