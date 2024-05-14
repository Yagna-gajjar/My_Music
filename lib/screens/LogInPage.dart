import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_music/utils/app_colors.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  TextEditingController _userPasswordController = TextEditingController();
  bool _passwordVisible = true;
  bool? checkBoxValue = false;

  void _toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        automaticallyImplyLeading: true,
        toolbarHeight: 300,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Center(child: Image.asset('assets/logo.png')),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          children: [
              Text(
                "Login to your account",
                style: GoogleFonts.varelaRound(
                    fontSize: 30,
                    color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: GoogleFonts.varelaRound(
                      color: Colors.grey[600]
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    fillColor: Colors.grey[900],
                    filled: true,
                    prefixIcon: Icon(Icons.mail_outline_outlined, color: Colors.grey[600],),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        // Clear text field logic here
                      },
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white60, // Change text color here
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: _userPasswordController,
                  obscureText: _passwordVisible,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: GoogleFonts.varelaRound(
                      color: Colors.grey[600],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2.0,
                      ),
                    ),
                    fillColor: Colors.grey[900],
                    filled: true,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.grey[600],
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        _toggle();
                      },
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white60,
                  ),
                ),
              ),
              Container(
          padding: EdgeInsets.all(5),
          child: CheckboxListTile(
            title: Text("Remember Me", style: GoogleFonts.varelaRound(color: Colors.white),),
            value: checkBoxValue,
              activeColor: AppColors.tertiaryColor,
              onChanged: (bool? newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              },
            side: BorderSide(
              color: AppColors.tertiaryColor
            ),
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage(),));
                      },
                      child: Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            "Log In",
                            style: GoogleFonts.varelaRound(
                                color: Colors.white),
                          )),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.tertiaryColor,
                      )),
                ),
              ],
            ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 30),
                child: Text("Forgot the password?", style: GoogleFonts.varelaRound(
                  color: AppColors.tertiaryColor
                ),),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                          shape: BoxShape.rectangle
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text("or continue with", style: GoogleFonts.varelaRound(
                        color: Colors.white
                      ),),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 1, style: BorderStyle.solid)
                    ),
                    child: Image.asset('assets/logo.png', fit: BoxFit.cover,),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 1, style: BorderStyle.solid)
                    ),
                    child: Image.asset('assets/logo.png', fit: BoxFit.cover,),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 1, style: BorderStyle.solid)
                    ),
                    child: Image.asset('assets/logo.png', fit: BoxFit.cover,),
                  ),
                ],
              )
            ]
          ),
      )
      );
  }
}
