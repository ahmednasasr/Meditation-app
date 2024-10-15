import 'package:flutter/material.dart';

import 'custome_con.dart';

class CategoryWidget extends StatelessWidget {
  final CustomeCat customeCon;
  final bool isSelected;

  CategoryWidget({required this.customeCon, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: customeCon.width,
      height: customeCon.height,
      decoration: BoxDecoration(
          color: isSelected ? Colors.green : customeCon.color,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.zero,
              bottomLeft: Radius.circular(25),
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset("${customeCon.pathImg}", scale: 1.5)),
            Center(
                child: Expanded(
                  child: Text(
                    customeCon.title,
                    style: const TextStyle(
                        fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
