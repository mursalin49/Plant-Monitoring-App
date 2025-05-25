// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'login_screen.dart';
//
// class DashboardScreen extends StatefulWidget {
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   final database = FirebaseDatabase.instance.ref();
//   int moisture = 0;
//   bool motorOn = false;
//
//   @override
//   void initState() {
//     super.initState();
//     listenToMoisture();
//     listenToMotorStatus();
//   }
//
//   void listenToMoisture() {
//     database.child("sensor/moisture").onValue.listen((event) {
//       final value = event.snapshot.value;
//
//       if (value != null) {
//         try {
//           int newMoisture;
//           if (value is int) {
//             newMoisture = value;
//           } else if (value is String) {
//             newMoisture = int.tryParse(value) ?? 0;
//           } else {
//             newMoisture = int.tryParse(value.toString()) ?? 0;
//           }
//
//           setState(() {
//             moisture = newMoisture;
//           });
//         } catch (e) {
//           print("Moisture parse error: $e");
//         }
//       }
//     });
//   }
//
//   void listenToMotorStatus() {
//     database.child("motor/manual").onValue.listen((event) {
//       final value = event.snapshot.value;
//
//       if (value != null) {
//         try {
//           bool newStatus;
//           if (value is bool) {
//             newStatus = value;
//           } else if (value is int) {
//             newStatus = value == 1;
//           } else if (value is String) {
//             newStatus = value.toLowerCase() == "true" || value == "1";
//           } else {
//             newStatus = false;
//           }
//
//           setState(() {
//             motorOn = newStatus;
//           });
//         } catch (e) {
//           print("Motor status parse error: $e");
//         }
//       }
//     });
//   }
//
//   void toggleMotor(bool value) {
//     setState(() {
//       motorOn = value;
//     });
//     database.child("motor/manual").set(value);
//   }
//
//   double getMoisturePercent() {
//     double percent = (1023 - moisture) / 1023;
//     return percent.clamp(0.0, 1.0);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double moisturePercent = getMoisturePercent();
//
//     return WillPopScope(
//       onWillPop: () async {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => SigninScreen()),
//         );
//         return false;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Plant Monitoring"),
//           centerTitle: true,
//           backgroundColor: Colors.green,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircularPercentIndicator(
//                 radius: 120.0,
//                 lineWidth: 14.0,
//                 animation: true,
//                 percent: moisturePercent,
//                 center: Text(
//                   "Soil Moisture value:\n$moisture",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
//                 ),
//                 footer: Padding(
//                   padding: const EdgeInsets.only(top: 16.0),
//                   child: Text(
//                     "Real-time Moisture Data",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                 ),
//                 circularStrokeCap: CircularStrokeCap.round,
//                 progressColor: Colors.green,
//               ),
//               SizedBox(height: 40.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Watering", style: TextStyle(fontSize: 22.0)),
//                   SizedBox(width: 20),
//                   Switch(
//                     value: motorOn,
//                     onChanged: toggleMotor,
//                     activeColor: Colors.green,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'login_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final database = FirebaseDatabase.instance.ref();
  int moisture = 0;
  bool motorOn = false;

  @override
  void initState() {
    super.initState();
    listenToMoisture();
    listenToMotorStatus();
  }

  void listenToMoisture() {
    database.child("sensor/moisture").onValue.listen((event) {
      final value = event.snapshot.value;
      if (value != null) {
        setState(() {
          moisture = int.tryParse(value.toString()) ?? 0;
        });
      }
    });
  }

  void listenToMotorStatus() {
    database.child("motor/manual").onValue.listen((event) {
      final value = event.snapshot.value;
      if (value != null) {
        setState(() {
          motorOn = value.toString() == "true" || value.toString() == "1";
        });
      }
    });
  }

  void toggleMotor(bool value) {
    database.child("motor/manual").set(value);
    setState(() {
      motorOn = value;
    });
  }

  double getMoisturePercent() {
    return ((1023 - moisture) / 1023).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    double moisturePercent = getMoisturePercent();

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SigninScreen()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Plant Monitoring"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 14.0,
                animation: true,
                percent: moisturePercent,
                center: Text(
                  "Soil Moisture:\n$moisture",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                footer: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Real-time Moisture Data",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.green,
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Watering", style: TextStyle(fontSize: 22.0)),
                  SizedBox(width: 20),
                  Switch(
                    value: motorOn,
                    onChanged: toggleMotor,
                    activeColor: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// // import 'package:flutter/material.dart';
// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:percent_indicator/circular_percent_indicator.dart';
// // import 'login_screen.dart';
// //
// // class DashboardScreen extends StatefulWidget {
// //   @override
// //   State<DashboardScreen> createState() => _DashboardScreenState();
// // }
// //
// // class _DashboardScreenState extends State<DashboardScreen> {
// //   final database = FirebaseDatabase.instance.ref();
// //   int moisture = 0;
// //   bool motorOn = false;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     listenToMoisture();
// //     listenToMotorStatus();
// //   }
// //
// //   void listenToMoisture() {
// //     database.child("sensor/moisture").onValue.listen((event) {
// //       final value = event.snapshot.value;
// //       if (value != null) {
// //         setState(() {
// //           moisture = int.tryParse(value.toString()) ?? 0;
// //         });
// //       }
// //     });
// //   }
// //
// //   void listenToMotorStatus() {
// //     database.child("motor/manual").onValue.listen((event) {
// //       final value = event.snapshot.value;
// //       if (value != null) {
// //         setState(() {
// //           motorOn = value.toString() == "true" || value.toString() == "1";
// //         });
// //       }
// //     });
// //   }
// //
// //   void toggleMotor(bool value) {
// //     database.child("motor/manual").set(value);
// //     setState(() {
// //       motorOn = value;
// //     });
// //   }
// //
// //   double getMoisturePercent() {
// //     return ((1023 - moisture) / 1023).clamp(0.0, 1.0);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     double moisturePercent = getMoisturePercent();
// //
// //     return WillPopScope(
// //       onWillPop: () async {
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(builder: (context) => SigninScreen()),
// //         );
// //         return false;
// //       },
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text("Plant Monitoring"),
// //           centerTitle: true,
// //           backgroundColor: Colors.green,
// //         ),
// //         body: Padding(
// //           padding: const EdgeInsets.all(24.0),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               CircularPercentIndicator(
// //                 radius: 120.0,
// //                 lineWidth: 14.0,
// //                 animation: true,
// //                 percent: moisturePercent,
// //                 center: Text(
// //                   "Soil Moisture:\n$moisture",
// //                   textAlign: TextAlign.center,
// //                   style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
// //                 ),
// //                 footer: Padding(
// //                   padding: const EdgeInsets.only(top: 16.0),
// //                   child: Text(
// //                     "Real-time Moisture Data",
// //                     style: TextStyle(fontSize: 20.0),
// //                   ),
// //                 ),
// //                 circularStrokeCap: CircularStrokeCap.round,
// //                 progressColor: Colors.green,
// //               ),
// //               SizedBox(height: 40.0),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text("Watering", style: TextStyle(fontSize: 22.0)),
// //                   SizedBox(width: 20),
// //                   Switch(
// //                     value: motorOn,
// //                     onChanged: toggleMotor,
// //                     activeColor: Colors.green,
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
