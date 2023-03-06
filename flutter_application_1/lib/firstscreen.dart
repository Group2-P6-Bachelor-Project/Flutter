import 'package:flutter/material.dart';
import 'package:flutter_application_1/CameraScreen.dart';

class MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/chopstick.jpg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 75),
              height: 50,
              width: 400,
              color: Colors.amber,
              child: const Text(
                'Begin Recycling',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontSize: 35,
                  color: Colors.blue,
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 50,
              width: 400,
              color: Colors.amber,
              child: const Text(
                'Begin Recycling',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 60,
              width: 200,
              margin: EdgeInsets.only(bottom: 50),
              child: ElevatedButton(
                child: const Text('Begin Recycling'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraScreen()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
