import 'package:flutter/material.dart';

class CustomeCard2 extends StatefulWidget {
  String image;
  String title1;
  String title2;

  CustomeCard2(this.image, this.title1, this.title2);

  @override
  State<CustomeCard2> createState() => _CustomeCard2State();
}

class _CustomeCard2State extends State<CustomeCard2> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 150,
        width: 200,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Image(image: AssetImage(widget.image)),
            Text(widget.title1),
            Text(widget.title2),
          ],
        ),
    );
  }
}
