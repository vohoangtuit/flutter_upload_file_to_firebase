
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upload_file/models/image.dart';

class ItemListView extends StatefulWidget {
  ImageFirebase image;
  Function onTap;
  ItemListView(this.image,this.onTap);
  @override
  _ItemListViewState createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  ImageFirebase products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      child: InkWell(
        onTap: widget.onTap,
        child:  Container(
          height: 100,
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.network(widget.image.url,width: 90,height: 100,),
                ],

              ),

            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}