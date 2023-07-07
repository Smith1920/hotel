import 'package:flutter/material.dart';
import '../../../home_page.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.blue),
        padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 100, vertical: 10)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
      },
      child: const Text(
        'Submit',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
    ;
  }
}
