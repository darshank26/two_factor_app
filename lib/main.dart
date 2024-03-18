import 'package:flutter/material.dart';
import 'package:flutter_2fa/flutter_2fa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: MyHome()));
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:50.0),
          child: Center(
            child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.asset('assets/images/logo.png',width: 200,height:200,),

                     const Padding(
                       padding: EdgeInsets.all(8.0),
                       child: Text(
                           textAlign: TextAlign.center,
                           '2 factor authentication \napp multi factor authentication',
                       style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                     ),

                    const SizedBox(height: 10),

                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Email id : aryangajakosh@gmail.com',
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blueAccent),
                          ),
                          onPressed: () => Flutter2FA().activate(
                              context: context,
                              appName: "2 factor authentication app multi factor authentication",
                              email: "aryangajakosh@gmail.com"),
                          child: const Text('Activate 2FA',
                          style: TextStyle(color: Colors.white,fontSize: 20),),
                        )),


                    const SizedBox(height: 30),
                    SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () => Flutter2FA()
                              .verify(context: context, page: const Success()),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          child: const Text('Login with 2FA',
                            style: TextStyle(color: Colors.white,fontSize: 20),
                        ),
                        )),

                    const SizedBox(height: 30),

                  ],
                )),
          ),
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          textAlign: TextAlign.center,
          'Designed & Developed by Aryan Gajakosh',
          style: TextStyle(fontSize: 16),),
      ),

    );
  }
}

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Column(
        children: [
          Text("Welcome, you have logged in successfully via 2FA system "),
          SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.redAccent),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white,fontSize: 18),
                ),
              ))

        ],
      )),
    );
  }


}