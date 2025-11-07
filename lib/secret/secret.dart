import 'package:flutter/material.dart';

class secret_screen extends StatelessWidget {
  const secret_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Congratulation, You Found The Secret',style: TextStyle(fontSize: 16),),),
      body: Column(
        children: [
          Image.asset('secret.jpg',
          fit: BoxFit.cover,
          ),

          Center(child: Padding(
            padding: const EdgeInsets.only(right: 20,left: 30,top: 40),
            child: Text('\t\t\t\t\t\tThis App is Made\n By Dev.Yousif Mohamed \n\t\t\t\t\t\t\t\t\t\tAbd-Elsalam',style: TextStyle(fontSize: 25,color: Color.fromRGBO(10, 15, 30, 1.0)),),
          ))
        ],
      )
    );
  }
}
