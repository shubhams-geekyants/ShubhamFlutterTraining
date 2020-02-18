import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_share/flutter_share.dart';

class CameraList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CameraListState();

}

class _CameraListState extends State<CameraList>{
  int _selectedView = 0;
  List _image = List().toList(growable: true);
  Future imageFromCamera() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      setState(() {
        print(image.path);
        _image.add(image);
      });
    }
  }

  Future imageFromGallery() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        print(image.path);
        _image.add(image);
      });
    }
  }

  Future<void> share(String path) async {
    await FlutterShare.shareFile(
      title: 'Image',
      text: 'Image share',
      filePath: path,
    );
  }

  dynamic popupOptions(context) => (){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Choose'),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
                imageFromCamera();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.camera_alt),
                    SizedBox(width: 15),
                    Text('Camera'),
                  ],
                ),
              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
                imageFromGallery();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.folder),
                    SizedBox(width: 15),
                    Text('Gallery'),
                  ],
                ),
              ),
            ),
          ],
        );
      }
    );
  };

  Widget gridView(){
    return Container(
      child: GridView.builder(
          itemCount: _image.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index)=> Stack(
            children: <Widget>[
              Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Image.file(_image[index], fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        alignment:Alignment.topLeft,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          _image[index].path.split('/')
                          [_image[index].path.split('/').length-1],
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                padding: EdgeInsets.only(left: 4),
                width: 40,
                child: FlatButton(
                  color: Colors.teal,
                  padding: EdgeInsets.all(1),
                  onPressed: (){
                    share(_image[index].path);
                  },
                  child: Icon(Icons.share, color: Colors.white),
                )
              )
            ],
          )
      ),
    );
  }

  Widget listView(){
    return Container(
      child: ListView.builder(
          itemCount: _image.length,
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index)=> Card(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment:Alignment.topLeft,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      _image[index].path.split('/')[_image[index].path.split('/').length-1],
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    child: Image.file(_image[index]),
                  ),
                  Container(
                    alignment:Alignment.centerRight,
                    child: IconButton(
                        onPressed: (){
                          share(_image[index].path);
                        },
                        icon: Icon(Icons.share)
                    ),
                  ),
                ],
              )
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.threesixty, color: Colors.white),
            onPressed: (){
              setState(() {
                if(_selectedView == 0){
                  _selectedView = 1;
                }else{
                  _selectedView = 0;
                }
              });
            },
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedView,
        children: <Widget>[
          listView(),
          gridView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: popupOptions(context),
      ),
    );
  }
}