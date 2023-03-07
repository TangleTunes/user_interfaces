// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_application/Components/text_inputs.dart';
import 'package:music_application/theme/theme_constants.dart';

import 'couple_account.dart';

class UnlockAccount extends StatelessWidget {
  const UnlockAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //the logo of Tangle Tunes and Tangle Tunes text 
              Container(
                  height: 82,
                  width: 82,
                  child: Center(
                    child: Image.asset('assets/logo_tangletunes.png'),
                  )
              ),
              SizedBox(height: 5),
              Text('Tangle Tunes',
                  style: GoogleFonts.francoisOne(fontSize: 30, color: COLOR_SECONDARY)
              ),
              SizedBox(height: 20),

              //The text input box for your password to unlock your account
              SizedBox(height: 20), 
              SizedBox(
                child: Container(
                  width: 373,
                  child: Text(
                    'Your password*',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: COLOR_SECONDARY,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6),
              Builder(builder: (BuildContext context) => passwordTextInput(context)),
              
              SizedBox(height: 25),
              //the register button, which redirects you to the discovery page iff you filled in all the boxes 
              SizedBox(
                width: 372,
                height: 56,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: COLOR_TERTIARY
                ),
                onPressed: (){
                  //TODO implement it to navigate to the discovery page
                },
                  child: Text(
                    'Unlock',
                      style: GoogleFonts.poppins(fontSize: 16)
                  ),
                ) 
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Use another account?',
                  style: TextStyle(
                    fontSize: 14,
                    color: COLOR_SECONDARY,
                  )),
                  TextButton(
                    onPressed: () {
                      //TODO implement a pop up to delete your account
                    },
                    child: Text('Delete wallet.',
                    style: TextStyle(
                      color: COLOR_SECONDARY,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    )))
                ],
              )

            ],
          )
        )
      )
    );
  }
}


