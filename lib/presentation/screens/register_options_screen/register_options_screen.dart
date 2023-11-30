import 'package:e_electromaps/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';

class RegisterOptionsScreen extends StatelessWidget {
  const RegisterOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DefaultButton(
                  content: 'Continue With Email',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  width: MediaQuery.sizeOf(context).height * 0.5,
                  backGroundColor: Colors.blue,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
