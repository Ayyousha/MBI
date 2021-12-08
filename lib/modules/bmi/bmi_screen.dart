
import 'dart:math';
import 'package:bmi/modules/bmi_result/bmi_result_screen.dart';
import 'package:bmi/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BMICalculator extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Consumer<providerChange>
    ( builder: (context,provider,child)
    {

      return Scaffold(
        backgroundColor: Colors.indigo[900],
        // appbar
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo[900],
          title: Text(
            'BMI CALCULATOR',
          ),
        ),
        // body
        body: Column(
          children: [
            // SizedBox
            SizedBox(
              height: 10,
            ),
            // The First Container  #
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 10.0,
                  top: 10.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                          provider.isMale();
                        },
                        child: Container(
                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image:
                              AssetImage(
                                'assets/images/male.png',
                              ),
                                height: 70,
                                width: 70,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,

                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: provider.isMALE ? Colors.pink[700] : Colors.indigo.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                          provider.isFemale();
                        },
                        child: Container(
                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image:
                              AssetImage(
                                'assets/images/female.png',
                              ),
                                height: 70,
                                width: 70,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,

                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: !provider.isMALE ? Colors.pink[700] : Colors.indigo.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // The Second Container ##
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 10.0,
                  top: 10.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.indigo.withOpacity(0.6),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 21,
                      ),
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,

                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${provider.height.round()}',
                            style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'CM',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                        ],

                      ),
                      Slider(
                        thumbColor: Colors.pink[500],
                        inactiveColor: Colors.indigo.withOpacity(0.7),
                        activeColor: Colors.white38.withOpacity(0.5),
                        value: provider.height,
                        max: 220.0,
                        min: 80.0,
                        onChanged: (value)
                        {
                          provider.bodyHeight(value);
                          print(value.round());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // The Third Container  ###
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 10.0,
                  top: 10.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '${provider.weight}',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                FloatingActionButton(
                                  onPressed: ()
                                  {
                                    provider.bodyWeightDecrease();
                                    print(provider.weight);
                                  },
                                  heroTag: 'weight--',
                                  backgroundColor: Colors.white38.withOpacity(0.5),
                                  mini: true,
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: ()
                                  {
                                    provider.bodyWeightIncrease();
                                    print(provider.weight);
                                  },
                                  heroTag: 'weight++',
                                  backgroundColor: Colors.white38.withOpacity(0.5),
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.indigo.withOpacity(0.6),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '${provider.age}',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                FloatingActionButton(
                                  onPressed: ()
                                  {
                                    provider.bodyAgeDecrease();
                                    print(provider.age);
                                  },
                                  heroTag: 'age--',
                                  backgroundColor: Colors.white38.withOpacity(0.5),
                                  mini: true,
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: ()
                                  {
                                    provider.bodyAgeIncrease();
                                    print(provider.age);
                                  },
                                  heroTag: 'age++',
                                  backgroundColor: Colors.white38.withOpacity(0.5),
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.indigo.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // The Fourth Container ####
            Container(
              width: double.infinity,
              color: Colors.pink[700],
              child: MaterialButton(

                height: 50.0,
                onPressed: ()
                {
                  double result = provider.weight / pow(provider.height / 100, 2);
                  print(result.round());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context) => BMIResultScreen(
                        isMALE: provider.isMALE,
                        age: provider.age,
                        result: result.round(),

                      ),
                    ),
                  );
                },
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      );


      }
    );
  }
}
