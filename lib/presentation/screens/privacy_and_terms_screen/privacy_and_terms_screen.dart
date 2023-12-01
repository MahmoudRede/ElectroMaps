import 'package:flutter/material.dart';

class PrivacyAndTermsScreen extends StatelessWidget {
  const PrivacyAndTermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80,
          ),
          const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Terms of service',
                style: TextStyle(color: Colors.black, fontSize: 25),
              )),
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            'assets/images/privacy_policy.jpg',
            height: 250,
            width: 250,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please review our',
                style: TextStyle(fontSize: 18),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Terms and Condions',
                    style: TextStyle(fontSize: 18, color: Colors.greenAccent),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'and',
                style: TextStyle(fontSize: 18),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Privacy Policy',
                    style: TextStyle(fontSize: 18, color: Colors.greenAccent),
                  )),
              const Text(
                'if you wish to',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const Text(
            'know more about the usage details of ElectroMaps',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(18)),
                child: const Center(
                  child: Text(
                    'I HAVE READ AND ACCEPT',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
