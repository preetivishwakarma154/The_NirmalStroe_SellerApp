import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../page-1/HomeScreen.dart';
import '../page-1/modal/constant.dart';

class StepperDemo extends StatefulWidget {
  StepperDemo() : super();

  final String title = "Stepper Demo";

  @override
  StepperDemoState createState() => StepperDemoState();
}

bool isActive = false;

class StepperDemoState extends State<StepperDemo> {
  //
  int current_step = 0;
  List<Step> steps = [
    Step(
      title: Steppertitle(
          date: '15/06/2023 9:22',
          title: 'Order Placed',
          dateTextStyle: productTextStyle,
          titleTextStyle: headingtextStyle),
      isActive: true,
      content: Text(''),
    ),
    Step(
      title: Steppertitle(
          date: '15/06/2023 9:42',
          title: 'Order Confirm',
          dateTextStyle: productTextStyle,
          titleTextStyle: headingtextStyle),
      content: Text(
        '',
        style: headingtextStyle,
      ),
      isActive: true,
    ),
    Step(
      title: Steppertitle(
          date: '17/06/2023 3:22',
          title: 'Order Shipped',
          dateTextStyle: productTextStyle,
          titleTextStyle: headingtextStyle),
      content: Text(
        '',
        style: headingtextStyle,
      ),
      state: StepState.indexed,
      isActive: true,
    ),
    Step(
      title: Steppertitle(
          date: '18/06/2023 9:29',
          title: 'Order Arrived at Nagpur Office',
          dateTextStyle: productTextStyle,
          titleTextStyle: headingtextStyle),
      content: Text(
        '',
        style: headingtextStyle,
      ),
      state: StepState.indexed,
      isActive: true,
    ),
    Step(
      title: Steppertitle(
          date: '20/06/2023 9:22',
          title: 'Order Arrived at Jaipur Office',
          dateTextStyle: productTextStyle,
          titleTextStyle: headingtextStyle),
      content: Text(
        '',
        style: TextStyle(
          color: ThemeColorGreen,
        ),
      ),
      isActive: true,
    ),
    Step(
      title: Steppertitle(
          date: '21/06/2023 5:22',
          title: 'Order Delivered',
          dateTextStyle: productTextStyle,
          titleTextStyle: TextStyle(fontSize: 14, color: ThemeColorGreen)),
      content: Text(
        '',
        style: TextStyle(
          color: ThemeColorGreen,
        ),
      ),
      state: StepState.complete,
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: buildAppBar(context),
      // Body
      body: Theme(
        data: ThemeData(
          canvasColor: Colors.yellow,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: ThemeColorYellow,
                background: ThemeColorBlue,
                secondary: ThemeColorGreen,
              ),
        ),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Settlement",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Stepper(
                    stepIconBuilder: (stepIndex, stepState) {},
                    currentStep: this.current_step,
                    steps: steps,
                    type: StepperType.vertical,
                    onStepTapped: (step) {
                      setState(() {
                        current_step = step;
                      });
                    },
                    onStepContinue: () {
                      setState(() {
                        if (current_step < steps.length - 1) {
                          isActive = true;
                          current_step = current_step + 1;
                        } else {
                          current_step = 0;
                        }
                      });
                    },
                    onStepCancel: () {
                      setState(() {
                        if (current_step > 0) {
                          current_step = current_step - 1;
                        } else {
                          current_step = 0;
                        }
                      });
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: ListTile(
                          title: Text('Circular Saw'),
                          subtitle: Text('Rs. 3,232'),
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/page-1/images/pro-back.png'),
                        height: MediaQuery.of(context).size.height * 0.11,
                      )
                    ],
                  ),
                ),
                Text(
                    "Circular Saw Raising a heavy fur muff that covered the whole of her lower arm towards the viewer regor then turned to look out the window."),

                Container(
                  padding: EdgeInsets.only(bottom: 10,top: 10),
                    child: Text("Quality: 1",style: productTextStyle,))
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Steppertitle extends StatelessWidget {
  const Steppertitle({
    super.key,
    required this.date,
    required this.title,
    required this.dateTextStyle,
    required this.titleTextStyle,
  });
  final String date, title;
  final TextStyle dateTextStyle, titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: ThemeColorDivider, width: 1),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5),
              child: Text(
                date,
                style: dateTextStyle,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  title,
                  style: titleTextStyle,
                ),
              ),
            ),
          ],
        ));
  }
}
