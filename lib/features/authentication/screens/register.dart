import 'package:flutter/material.dart';
import 'package:hotel/home_page.dart';
import 'package:dio/dio.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isActive = false;
  bool isLoading = false;
  ValueNotifier<TextEditingController> phoneNumber =
      ValueNotifier<TextEditingController>(TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/images/5831236.jpg",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const Spacer(
                flex: 1,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Welcome to the MemoryBook',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: phoneNumber.value,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        prefix: Text('+91 '),
                        label: Text('Phone-Number'),
                        hintText: '00000 00000',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ValueListenableBuilder(
                valueListenable: phoneNumber,
                builder: (context, value, child) {
                  if (value.text.length >= 10) {
                    return ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10)),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    );
                  } else {
                    return const ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.grey),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10)),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      onPressed: null,
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white54),
                      ),
                    );
                  }
                },
              ),
              const Spacer(
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
