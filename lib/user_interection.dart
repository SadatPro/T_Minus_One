import 'package:animated_expandable_fab/expandable_fab/action_button.dart';
import 'package:animated_expandable_fab/expandable_fab/expandable_fab.dart';
import 'package:flutter/material.dart';

class CO2Interaction extends StatefulWidget {
  const CO2Interaction({super.key});

  @override
  _CO2InteractionState createState() => _CO2InteractionState();
}

class _CO2InteractionState extends State<CO2Interaction> {
  bool isCO2Added = false;
  bool showOxygen = false;
  bool isShowCo2 = true;
  bool isAir = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: ExpandableFab(
        distance: 100,
        openIcon: const Icon(Icons.add),
        closeIcon: const Icon(Icons.close),
        children: [
          ActionButton(
            color: Colors.white,
            padding: const EdgeInsets.all(5),
            onPressed: () {
              setState(() {
                isCO2Added = true;
                isAir = true;
              });
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  showOxygen = true;
                  isShowCo2 = false;
                  isCO2Added = false;
                  isAir = false;
                });
              });

              Future.delayed(const Duration(seconds: 4), () {
                AlertDialog alert = const AlertDialog(
                  backgroundColor: Colors.blue,
                  contentPadding: EdgeInsets.all(20),
                  content: Text(
                    '20 kg/mole of CO2 Fluxed',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              });
            },
            icon: Image.asset('assets/co2.png', height: 40),
          ),
          ActionButton(
            color: Colors.white,
            padding: const EdgeInsets.all(5),
            onPressed: () {},
            icon: Image.asset('assets/o2.png', height: 40),
          ),
          ActionButton(
            color: Colors.white,
            padding: const EdgeInsets.all(5),
            onPressed: () {},
            icon: Image.asset('assets/so2.png', height: 40),
          ),
          ActionButton(
            color: Colors.white,
            padding: const EdgeInsets.all(5),
            onPressed: () {},
            icon: Image.asset('assets/ch4.png', height: 40),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/sea.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 100,
            child: Image.asset(
              'assets/phytoplankton.png',
              height: 100,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 300,
            child: Image.asset(
              'assets/phytoplankton.png',
              height: 100,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 500,
            child: Image.asset(
              'assets/phytoplankton.png',
              height: 100,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 700,
            child: Image.asset(
              'assets/phytoplankton.png',
              height: 100,
            ),
          ),

          AnimatedPositioned(
            duration: const Duration(seconds: 2),
            top: isAir ? 100 : -180,
            left: 400,
            child: Image.asset(
              isAir ? 'assets/air.png' : 'assets/empty.png',
              height: 200,
            ),
          ),

          /// ----------------- Other So2 ---------------------
          Positioned(
            top: -10,
            left: 150,
            child: Image.asset('assets/so2.png', height: 100),
          ),
          Positioned(
            top: -10,
            left: 400,
            child: Image.asset('assets/so2.png', height: 100),
          ),
          Positioned(
            top: -10,
            left: 550,
            child: Image.asset('assets/so2.png', height: 100),
          ),
          Positioned(
            top: -10,
            left: 750,
            child: Image.asset('assets/so2.png', height: 100),
          ),

          /// ----------------- CH4 ---------------------
          Positioned(
            top: 60,
            left: 200,
            child: Image.asset('assets/ch4.png', height: 100),
          ),
          Positioned(
            top: 60,
            left: 350,
            child: Image.asset('assets/ch4.png', height: 100),
          ),
          Positioned(
            top: 60,
            left: 610,
            child: Image.asset('assets/ch4.png', height: 100),
          ),
          Positioned(
            top: 60,
            left: 790,
            child: Image.asset('assets/ch4.png', height: 100),
          ),

          /// ----------------- Oxygen Animation ---------------------
          if (showOxygen)
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              top: showOxygen ? 40 : 500,
              left: 100,
              child: Image.asset(
                'assets/o2.png',
                height: 60,
              ),
            ),
          if (showOxygen)
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              top: showOxygen ? 40 : 500,
              left: 300,
              child: Image.asset(
                'assets/o2.png',
                height: 60,
              ),
            ),
          if (showOxygen)
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              top: showOxygen ? 40 : 500,
              left: 500,
              child: Image.asset(
                'assets/o2.png',
                height: 60,
              ),
            ),
          if (showOxygen)
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              top: showOxygen ? 40 : 500,
              left: 700,
              child: Image.asset(
                'assets/o2.png',
                height: 60,
              ),
            ),

          /// ----------------- CO2 Animation ---------------------
          if (isShowCo2)
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              top: isCO2Added ? 260 : 50,
              left: 100,
              child: Image.asset(
                'assets/co2.png',
                height: 60,
              ),
            ),
          if (isShowCo2)
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              top: isCO2Added ? 260 : 50,
              left: 300,
              child: Image.asset(
                'assets/co2.png',
                height: 60,
              ),
            ),
          if (isShowCo2)
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              top: isCO2Added ? 260 : 50,
              left: 500,
              child: Image.asset(
                'assets/co2.png',
                height: 60,
              ),
            ),
          if (isShowCo2)
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              top: isCO2Added ? 260 : 50,
              left: 700,
              child: Image.asset(
                'assets/co2.png',
                height: 60,
              ),
            ),
        ],
      ),
    );
  }
}
