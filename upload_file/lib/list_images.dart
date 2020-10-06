import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:upload_file/models/image.dart';

import 'item.dart';

class ListImages extends StatefulWidget {
  @override
  _ListImagesState createState() => _ListImagesState();
}

class _ListImagesState extends State<ListImages> {
   List<ImageFirebase> list = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Images'),centerTitle: true,),
      body: Container(
         child:  list.length==0?noData():initListView(),
      ),

    );
  }
   ListView initListView(){
     return ListView.separated(// or separated // builder
       separatorBuilder: (context, index) => Divider(
         color: Colors.grey,height: 1,
         indent: 10.0,// padding left
         endIndent: 20,// padding right
       ),
       itemCount: list.length!=null?list.length:0,
       itemBuilder: (context,index){
         return ItemListView(list[index],(){
           print("on tap");
         });
       },
     );
   }
   void getFirebaseImageFolder() async{
     final StorageReference storageRef = FirebaseStorage.instance.ref().child('images');
     // storageRef.listAll().then((result) {
     //   print("result is $result");
     // });
     var data = await storageRef.getData(50).then((value) => {

     });
     var firebaseStore = FirebaseStorage.instance.ref().child('images');
// todo: current can not get all list from storage
     List<String>string=new List();
     firebaseStore.getDownloadURL().then((value) => {
       print("result is $value")
     });

   }
   Widget noData(){
     return Center(
       child: Container(
         alignment: Alignment.center,
         child: Text('No Data'),
       ),
     );
   }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFirebaseImageFolder();
  }
}
