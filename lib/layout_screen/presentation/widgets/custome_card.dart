import 'package:flutter/material.dart';

class CustomeCard extends StatelessWidget {
  String image;
  Color color;
  String name;
   CustomeCard({super.key,required this.image,required this.color,required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Stack(
        children: [
          Positioned(
            left: 100,
              child: Image(image: AssetImage(image))),
          Positioned(
              left: 10,
              top: 20,
              child: Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          Positioned(
            top: 120,
              left: 100,
              child: ElevatedButton(onPressed: (){}, child: Text("Start")))
          
        ],
      ),
    );
  }
}
