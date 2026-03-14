import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:masbaha/home.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    TextEditingController userName = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height, 
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.15), 
            Text(
              "مرحباً في مُسلم",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Merriweather_36pt",
                fontSize: size.width * 0.06, 
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              "Muslim",
              style: TextStyle(
                color: Color(0xffffd364),
                fontFamily: "Bungee",
                fontSize: size.width * 0.12,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Text(
                "رفيقك اليومي للصلاة، والأدعية، والذكر",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(.7),
                  fontFamily: "Merriweather_36pt",
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            InkWell(
              onTap: () {
                final box = Hive.box('zekrBox');
                 box.put("seenWelcome", true);
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("أدخل اسمك"),
                    content: TextField(
                      controller: userName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                      ),
                      
                       decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffffd364), )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffffd364), )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffffd364), )
                        ),
                        filled: true,
                        fillColor: Color(0xff1e222d)
                       ),
                    ),
                    actions: [
                      TextButton(onPressed: (){
                       
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen(name: userName.text)));
                      }, child: Text("تأكيد",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 28),))
      
                    ],
                  );
                });
      
      
              },
              child: Container(
                width: size.width * 0.6, 
                height: size.height * 0.07,
                decoration: BoxDecoration(
                  color: Color(0xffe6b453),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "ابدأ الآن",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Merriweather_36pt",
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "أو تصفح الأذكار",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Merriweather_36pt",
                    fontSize: size.width * 0.045,
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                Icon(
                  Icons.arrow_forward,
                  color: Color(0xffe6b453),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}