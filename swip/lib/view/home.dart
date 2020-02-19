import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter new City'),
          content: TextField(
            keyboardType: TextInputType.text,
            controller: customController,
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text('Submit'),
              onPressed: () {
                String newCity = customController.text.toString();
                if (newCity.isNotEmpty) {
                  Navigator.of(context).pop(newCity);
                }
              },
            ),
          ],
        );
      },
    );
  }

  List<String> cities;
  int keyIterator;
  @override
  void initState() {
    cities = [
      'Bangalore',
      'Delhi',
      'Prayagraj',
      'Goa',
      'Noida',
      'Kota',
      'Jaipur',
      'Shimla',
      'Chandigarh',
      'Mangalore'
    ];
    keyIterator = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Cities'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAlertDialog(context).then((onValue) {
            if (onValue.isNotEmpty) {
              setState(() {
                cities.add(onValue);
              });
            }
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key((keyIterator++).toString()),
                child: ListTile(
                  title: Text(cities.elementAt(index)),
                  trailing: Icon(Icons.location_on),
                ),
                background: Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.delete, color: Colors.white),
                      Icon(Icons.delete, color: Colors.white),
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  String removed = cities.elementAt(index);
                  Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Removed ${cities.elementAt(index)}"),
                        action: SnackBarAction(
                          onPressed: (){
                            setState(() {
                              cities.insert(index, removed);
                            });
                          },
                          label: 'UNDO',
                        ),
                      ));
                  setState(() {
                    cities.removeAt(index);
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}