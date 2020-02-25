import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: GecmisDersler(),
    );
  }
}


class GecmisDersler extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GecmisDersler();
  }
}

double _width = 300;
double _height = 50;
BorderRadiusGeometry _borderRadius = BorderRadius.circular(55);

class Dersler {
  double width;
  double height;
  AnimatedContainer animatedContainer;

  Dersler(double width, double height, AnimatedContainer animatedContainer) {
    this.width = width;
    this.height = height;
    this.animatedContainer = animatedContainer;
  }
}

class Notlar {
  int id;
  String name;

  Notlar(this.id, this.name);

  static List<Notlar> getCompanies() {
    return <Notlar>[
      Notlar(1, 'AA'),
      Notlar(2, 'BA'),
      Notlar(3, 'BB'),
      Notlar(4, 'CB'),
      Notlar(5, 'CC'),
      Notlar(6, 'DC'),
      Notlar(7, 'DD'),
      Notlar(8, 'FD'),
      Notlar(9, 'FF'),
      Notlar(10, 'F0'),
    ];
  }
}

List<Notlar> _companies = Notlar.getCompanies();
List<DropdownMenuItem<Notlar>> _dropdownMenuItems;
Notlar _selectedCompany;
Notlar s;

class _GecmisDersler extends State<GecmisDersler> {
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  Notlar selectedCompany;

  List<DropdownMenuItem<Notlar>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Notlar>> items = List();
    for (Notlar company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  var currentSelectedValue;


  List<Notlar> _selectedCompanys = [];



  int i = 0;
  List<ExpansionTile> list = [];
  List<int> dersCount = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uni-Grade'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  // list.add(...);
                  _selectedCompanys.add(_dropdownMenuItems[0].value);
                  dersCount.add(0);
                });
              },
              child: Icon(
                Icons.add,
                size: 30.00,
              ),
            ),
          ),
        ],
      ),
      body: new ListView.builder(
          itemCount: _selectedCompanys.length,
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
          itemBuilder: (context, int index) {
            return ExpansionTile(
              title: Text((index + 1).toString() + '. Dönem'),
              children: <Widget>[
                ListView.builder(
                  itemCount: dersCount[index],
                  padding: EdgeInsets.only(top: 5),
                  shrinkWrap: true,
                  itemBuilder: (context, int index2) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 200,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: ' Ders Adı'),
                              ),
                            ),
                            SizedBox(
                              width: 65,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'ECTS'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 80,
                              child: DropdownButton(
                                value: _selectedCompanys[index],
                                items: _dropdownMenuItems,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedCompanys[index] = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      dersCount[index] = dersCount[index] + 1;
                    });
                  },
                  child: Icon(
                    Icons.add_box,
                    size: 35,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: 30,
                    )
                  ],
                )
              ],
            );
          }),
    );
  }

}
