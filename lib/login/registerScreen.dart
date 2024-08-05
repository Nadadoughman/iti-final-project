import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom%20navigator/home_screen.dart';
import 'package:flutter_application_1/login/login.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool visible = true;
  var formkey = GlobalKey<FormState>();
  TextEditingController emailController =
      TextEditingController(); // to store values when user input
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    // to appear first before ui once i open app
    super.initState();
    // emailController = TextEditingController(text: "nada@gmail.com");
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   emailController.dispose();
  //   passwordController.dispose();
  //   firstNameController.dispose();
  //   lastnameController.dispose();
  //   ageController.dispose();
  //   locationController.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,),
   
      body:
      
      
           Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Create Account",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color:  Color.fromARGB(255, 17, 36, 238)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //firstname
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: firstNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "must enter your name";
                        }
           
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "First Name",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //lastname
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: lastnameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "must enter your name";
                        }
           
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Last Name",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //age
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: ageController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "must enter your age ";
                        }
           
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "age",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
           
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                      
                        if (value!.isEmpty) {
                          return "Email address must not be empty";
                        }
                        if (value == false) {
                          return "Invalid email format";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "email",
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
           
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: visible,
                      controller: passwordController,
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Password is too short";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "password",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {
                                if(mounted) setState(() {
                                  visible = !visible;
                                });
                              },
                              icon: Icon(visible
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      color: Color.fromARGB(255, 17, 36, 238),
                      child: MaterialButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            print(emailController
                                .text); // to print text onlu because controller has list of values
                            print(passwordController.text);
                         
                              //create user
                            
                        try {
           
           
             UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
               email: emailController.text,
               password: passwordController.text,
             );
           
             // Save  user data to Firestore  
           
            
             await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
               'firstName': firstNameController.text, 
               'lastName': lastnameController.text,
               'age': int.tryParse(ageController.text) ?? 0, // Handle potential parsing errors
               'email': emailController.text,
             });
           
             // ... (rest of your code)
           } catch (e) {
             print('Error storing user data: $e');
             // Handle the error appropriately, e.g., show an error message to the user
           
                            }
           
                          }
                           Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home_layout()));
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen()));
                            },
                            child: const Text("login",style: TextStyle(color:  Color.fromARGB(255, 17, 36, 238)),))
                      ],
                    )
                  ],
                ),
              ),
            ),
                 ),
         
       
    );
  }


}
