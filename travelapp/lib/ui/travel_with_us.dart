import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelapp/ui/app_bar.dart';
import 'package:travelapp/service/randome_image_picker.dart';


class TravelWithUs extends StatefulWidget{
  TravelWithUs();
  @override
  State<StatefulWidget> createState() =>
      _TravelWithUsState();
}


class _TravelWithUsState extends State<TravelWithUs>{
  Map<String, String> _imageData;
  @override
  void initState() {
    super.initState();
    _imageData = RandomImagePicker.random();
  }
  void _nextImage(){
    setState(() {
      _imageData = RandomImagePicker.random();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return  Scaffold(
      appBar: AppBar(
        title: MyAppBar('Travel with us'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Row(
                children: <Widget>[
                  Expanded(child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 400,
                      maxHeight: 600,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 4,
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.blueGrey,
                                  ),
                                  borderRadius: BorderRadius.circular(5)
                              ),
//                          padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Image.asset(_imageData['url'],
                                  height: 300,
                                  fit: BoxFit.cover
                              ),
                            ),
                            ListTile(
//                          leading: Icon(Icons.location_on),
                              title: Text(_imageData['content'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                              subtitle: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(_imageData['location'], textAlign: TextAlign.end),
                                    Icon(Icons.location_on, color: Colors.black26),
                                  ],
                                ),
                              ),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  color:Colors.teal,
                                  elevation: 0,
                                  child: const Text('LET\'S GO',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: Colors.white
                                      )
                                  ),
                                  onPressed: () { /* ... */ },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(right: 20, bottom: 10),
                  child: RaisedButton(
                    color: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    onPressed: _nextImage,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('LOAD MORE', style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          )),
                          SizedBox(width: 15),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}