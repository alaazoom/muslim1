import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masbaha/salah.dart';
import 'package:masbaha/morrningPrayers.dart';
import 'package:masbaha/night.dart';
import 'package:masbaha/quranDuaas.dart';

class HomeScreen extends StatelessWidget {
  final String name;

  HomeScreen({super.key, required this.name});

  String getPrayerName(DateTime now) {
    int hour = now.hour;
    if (hour >= 5 && hour < 12) {
      return 'الفجر';
    } else if (hour >= 12 && hour < 15) {
      return 'الظهر';
    } else if (hour >= 15 && hour < 18) {
      return 'العصر';
    } else if (hour >= 18 && hour < 20) {
      return 'المغرب';
    } else {
      return 'العشاء';
    }
  }

  Image getImage(DateTime now, Size size) {
    double imgSize = size.width * 0.25;

    int hour = now.hour;
    if (hour >= 5 && hour < 12) {
      return Image.asset("images/sunrise.png", height: imgSize, width: imgSize);
    } else if (hour >= 12 && hour < 15) {
      return Image.asset("images/afternoon.png", height: imgSize, width: imgSize);
    } else if (hour >= 15 && hour < 18) {
      return Image.asset("images/daytime.png", height: imgSize, width: imgSize);
    } else if (hour >= 18 && hour < 20) {
      return Image.asset("images/moon.png", height: imgSize, width: imgSize);
    } else {
      return Image.asset("images/night.png", height: imgSize, width: imgSize);
    }
  }

  String formatTime(DateTime now) {
    int hour = now.hour;
    String period = "AM";

    if (hour >= 12) {
      period = "PM";
      if (hour > 12) hour -= 12;
    } else if (hour == 0) {
      hour = 12;
    }

    String minute = now.minute.toString().padLeft(2, '0');
    return "$hour:$minute $period";
  }

  List<String> type = [
    "أذكار الصباح",
    "أذكار المساء",
    "أدعية من القرآن",
    " بعد الصلاة",
  ];

  List<String> images = [
    "images/mo.png",
    "images/ni.png",
    "images/quran.png",
    "images/prayer.png",
  ];
  List<Widget>screens=[
    MorningAzkarPage(),

        NightAzkarPage(),

    QuranDuaas(),
    

    DeadDuaas()
    

  ];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final size = MediaQuery.of(context).size;

    String formattedDate = DateFormat('dd MMMM yyyy').format(now);

    return Scaffold(
      backgroundColor: const Color(0xff222933),
      body: Stack(
        children: [

          /// HEADER
          Positioned(
            top: 0,
            child: Container(
              height: size.height * 0.3,
              width: size.width,
              decoration: const BoxDecoration(
                color: Color(0xff81794a),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "أهلاً وسهلاً $name",
                          style: TextStyle(
                            color: const Color(0xffffd364),
                            fontFamily: "Bungee",
                            fontSize: size.width * .06,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(width: size.width * 0.03),
                        Image.asset(
                          "images/user.png",
                          height: size.width * 0.1,
                          width: size.width * 0.1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// PRAYER CARD
          Positioned(
            top: size.height * 0.15,
            left: size.width * 0.05,
            right: size.width * 0.05,
            child: Container(
              height: size.height * 0.25,
              decoration: BoxDecoration(
                color: const Color(0xff171e28),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.all(size.width * 0.04),
                    width: size.width * 0.38,
                    decoration: BoxDecoration(
                      color: const Color(0xff30343d),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            "موعد صلاة ${getPrayerName(now)}",
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          SizedBox(height: size.height * 0.01),

                          Text(
                            formatTime(now),
                            style: TextStyle(
                              fontSize: size.width * 0.07,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          SizedBox(height: size.height * 0.01),

                          Text(
                            formattedDate,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  getImage(now, size),
                ],
              ),
            ),
          ),

          /// GRID
          Positioned(
            top: size.height * 0.42,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: size.height * 0.04,
                  crossAxisSpacing: size.width * 0.04,
                  childAspectRatio: 1,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>screens[index]));
                        },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff393d46),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                    
                        Positioned(
                          top: -size.height * 0.045,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Image.asset(
                                images[index],
                                height: size.height * 0.14,
                                width: size.width * 0.24,
                              ),
                    
                              SizedBox(height: size.height * 0.02),
                    
                              Text(
                                type[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Merriweather_36pt",
                                  fontSize: size.width * 0.05,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}