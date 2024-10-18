import 'package:flutter/material.dart';

import 'custome_meditate.dart';

class CustomeMeditateCon extends StatelessWidget {
  final CustomeMeditate customeMeditate;

  CustomeMeditateCon({required this.customeMeditate, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: customeMeditate.width,
      height: customeMeditate.height,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.zero,
              bottomLeft: Radius.circular(25),
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25))),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Image.asset("${customeMeditate.pathImg}",width: customeMeditate.width,height: customeMeditate.height,)),
              Center(
                  child: Expanded(
                    child: Text(
                      customeMeditate.title,
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
