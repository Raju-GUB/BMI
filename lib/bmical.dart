import 'package:day19/output.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BMIUIdesign extends StatefulWidget {
  const BMIUIdesign({super.key});

  @override
  State<BMIUIdesign> createState() => _BMIUIdesignState();
}

class _BMIUIdesignState extends State<BMIUIdesign> {
  myAlert() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            width: 200,
            color: Colors.black,
            child: Card(
              child: AlertDialog(
                  title: Text('BMI STATUS',style: TextStyle(color: Colors.amberAccent,fontSize: 25),),
                  content: BMI <= 18.4
                      ? Text(
                          'Your BMI Value is ${BMI}\nYou are in the underweight range')
                      : BMI >= 18.5 && BMI <= 24.9
                          ? Text(
                              'Your BMI Value is ${BMI}\nYou are in the healthy range')
                          : BMI >= 25 && BMI <= 29.9
                              ? Text(
                                  'Your BMI Value is ${BMI}\nYou are in the overweight range')
                              : Text('Your BMI Value is ${BMI}\nYou are in the obese range'),
                              actions: [TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text('Re-Calculate')),
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text('Cancel',style: TextStyle(color: Colors.red),))
                              ],
                              ),
            ),
          );
        });
  }

  bool isMale = true;
  double height = 180;
  int weight = 60;
  int age = 23;
  dynamic? BMI;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF090E21),
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 5,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isMale = true;
                            });
                          },
                          child: Card(
                            color: isMale ? Colors.amber : Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(Icons.male), Text('Male')],
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 5,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isMale = false;
                            });
                          },
                          child: Card(
                            color: isMale ? Colors.white : Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(Icons.female), Text('Female')],
                            ),
                          ),
                        ))
                  ],
                )),
            Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                        //flex: 5,
                        child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${height.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                              Text('cm')
                            ],
                          ),
                          Slider(
                              min: 70,
                              max: 210,
                              inactiveColor: Colors.grey,
                              value: height,
                              onChanged: (val) {
                                setState(() {
                                  height = val;
                                });
                              })
                        ],
                      ),
                    )),
                  ],
                )),
            Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('WEIGHT(kg)'),
                              Text(
                                '$weight',
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(15),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (weight >= 1) {
                                            weight--;
                                          }
                                        });
                                      },
                                      child: Icon(Icons.remove)),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(15),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      child: Icon(Icons.add))
                                ],
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 5,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('AGE(year)'),
                              Text(
                                '$age',
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(15),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (age >= 1) {
                                            age--;
                                          }
                                        });
                                      },
                                      child: Icon(Icons.remove)),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(15),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      child: Icon(Icons.add))
                                ],
                              )
                            ],
                          ),
                        )),
                  ],
                )),
            MaterialButton(
              onPressed: () {
                setState(() {
                  height = height / 100;
                  double bmi = weight / (height * height);
                  BMI = bmi;
                  print('Your BMI is ${bmi.toStringAsFixed(2)}');
                  myAlert();
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OutPut(cal: bmi,)));
                });
              },
              color: Colors.blue,
              minWidth: double.infinity,
              child: Text('CALCULATE BMI'),
            )
          ],
        ),
      ),
    );
  }
}
