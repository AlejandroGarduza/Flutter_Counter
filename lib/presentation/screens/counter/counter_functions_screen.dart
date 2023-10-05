import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Counter Functions',
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$clickCounter',
                style:
                    const TextStyle(fontSize: 158, fontWeight: FontWeight.w100),
              ),
              Text(
                'Click${clickCounter != 1 ? 's' : ''}',
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
                icon: Icons.refresh_outlined,
                onPressed: () {
                  setState(() {
                    this.clickCounter != 0 ? this.clickCounter = 0 : "";
                  });
                }),
            const SizedBox(
              height: 13,
            ),
            CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  this.clickCounter++;
                });
              },
            ),
            const SizedBox(
              height: 13,
            ),
            CustomButton(
                icon: Icons.exposure_minus_1_rounded,
                onPressed: () {
                  setState(() {
                    this.clickCounter != 0 ? this.clickCounter-- : "";
                  });
                })
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      elevation: 5,
      backgroundColor: Colors.purple.shade100,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
