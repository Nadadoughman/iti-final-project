import 'package:flutter/material.dart';
import 'package:flutter_application_1/login/login.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  final List<PageViewModel> pages = [
    PageViewModel(
        titleWidget: const Text(
          "Discover",
          style: TextStyle(
              color:  Color.fromARGB(255, 17, 36, 238), fontWeight: FontWeight.w400, fontSize: 35),
        ),
        bodyWidget: const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
        image: Center(
          child: Image.asset(
            "images/welcomee.png",
            height: 500,
            width: 500,
            fit: BoxFit.fill,
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
    PageViewModel(
        titleWidget: const Text(
          "Customize",
          style: TextStyle(
              color: Color.fromARGB(255, 17, 36, 238), fontWeight: FontWeight.w400, fontSize: 35),
        ),
        bodyWidget: const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
        image: Center(
          child: Image.asset(
            "images/worker.png",
            width: double.infinity,
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
    PageViewModel(
        titleWidget: const Text(
          "Get Delivered",
          style: TextStyle(
              color:  Color.fromARGB(255, 17, 36, 238), fontWeight: FontWeight.w400, fontSize: 35),
        ),
        bodyWidget: const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim venia."),
        image: Center(
          child: Image.asset(
            "images/deliver.png",height: 500,
            width: 500,
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold)))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 17, 36, 238),
        title: const Text(
          "Welcome to our app",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        pages: pages,
        dotsDecorator: const DotsDecorator(
          size: Size(10, 10),
          color: Color.fromARGB(255, 0, 0, 0),
          activeSize: Size.square(15),
          activeColor: Color.fromARGB(255, 17, 36, 238),
        ),
        showDoneButton: true,
        done: const Text(
          "done",
          style: TextStyle(fontSize: 20),
        ),
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(fontSize: 20),
        ),
        showNextButton: true,
        next: const Icon(
          Icons.arrow_forward,
          size: 20,
        ),
        onDone: () => onDone(context),
      ),
    );
  }
}

void onDone(context) {
// final prefs = await SharedPreferences.getInstance();
// await prefs.setBool("on_boarding", false);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const LoginScreen()));
}
