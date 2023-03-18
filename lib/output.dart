import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OutPut extends StatefulWidget {
  //const OutPut({super.key});
 dynamic cal;
  OutPut({
    this.cal,
  });

  @override
  State<OutPut> createState() => _OutPutState();
}

class _OutPutState extends State<OutPut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Your BMI ${widget.cal}"),
    );
  }
}