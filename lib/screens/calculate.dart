import 'package:bmicalculator/calculation.dart';
import 'package:bmicalculator/screens/result%20page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

enum Gender { male, female }

class _HomeState extends State<Home> {
  int height = 100;
  int weight = 30;
  int age = 20;

  Gender? selectedgender;

  int incriment(int result) {
    setState(() {
      result++;
    });
    return result;
  }

  int decriment(int result, String ischeck) {
    setState(() {
      if (result <= 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('invalid $ischeck')));
      } else {
        result--;
      }
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(
            'Check Your BMI',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedgender = Gender.female;
                  });
                  print(selectedgender);
                },
                child: buildCircleAvatar(
                    selectedgender == Gender.female
                        ? Colors.blue.shade900
                        : Colors.blue.shade500,
                    'https://cdn3d.iconscout.com/3d/premium/thumb/woman-avatar-6299541-5187873.png'),
              ),
              SizedBox(
                width: 40,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedgender = Gender.male;
                    });
                    print(selectedgender);
                  },
                  child: buildCircleAvatar(
                      selectedgender == Gender.male
                          ? Colors.blue.shade900
                          : Colors.blue.shade500,
                      'https://cdn3d.iconscout.com/3d/premium/thumb/man-avatar-6299539-5187871.png')),
            ],
          ),
          Divider(
            height: 40,
            color: Colors.blue.shade500,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue.shade500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ Text(
                'Height',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),

                Text(
                  height.toString() + 'cm',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Slider(
                    inactiveColor: Colors.white,
                    activeColor: Colors.blue.shade900,
                    min: 100,
                    max: 190,
                    value: height.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                      print(height);
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: buildContainer(
                    "Weight",
                    weight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.blue.shade900,


                          onPressed: () {
                            setState(() {

                              weight= incriment(weight);
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.blue.shade900,
                          onPressed: () {
                            setState(() {
                            weight=  decriment(weight, 'weight');
                            });
                          },
                          child: Icon(Icons.remove),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: buildContainer(
                    "Age",
                    age,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.blue.shade900,

                          onPressed: () {
                            setState(() {


                             age =incriment(age);
                              print(age);
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.blue.shade900,

                          onPressed: () {
                            setState(() {
                            age=  decriment(age, 'age');
                            });
                          },
                          child: Icon(Icons.remove),
                        ),
                      ],
                    )),
              ),

            ],
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Bmi objbmi = new Bmi(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                          result: objbmi.calculatebmi(),
                          status: objbmi.status(),
                          interpret: objbmi.interpret())));
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.shade500),
              child: Center(
                  child: Text(
                'Calculate',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
            ),
          )
        ]),
      ),
    );
  }

  Container buildContainer(String text, int value, Widget widget) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.blue.shade500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          Text(value.toString(),
              style: TextStyle(color: Colors.white, fontSize: 25)),
          widget
        ],
      ),
    );
  }

  CircleAvatar buildCircleAvatar(Color color, String image) {
    return CircleAvatar(
        backgroundColor: color,
        radius: 80,
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.blue.shade500,
          backgroundImage: NetworkImage(image),
        ));
  }
}
