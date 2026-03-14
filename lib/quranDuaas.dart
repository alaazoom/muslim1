



import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class QuranDuaas extends StatefulWidget {
  const QuranDuaas({super.key});

  @override
  State<QuranDuaas> createState() => _QuranDuaasState();
}

class _QuranDuaasState extends State<QuranDuaas> {
   List<bool> read2=[];
  late Box box;


    List<String> duas = [
"اهدِنَا الصِّرَاطَ المُستَقِيمَ صِرَاطَ الَّذِينَ أَنعَمتَ عَلَيهِمْ غَيرِ المَغضُوبِ عَلَيهِمْ وَلاَ الضَّالِّينَ",

"رَبَّنَا تَقَبَّلْ مِنَّا إِنَّكَ أَنتَ السَّمِيعُ الْعَلِيمُ",

"رَبَّنَا وَاجْعَلْنَا مُسْلِمَيْنِ لَكَ وَمِن ذُرِّيَّتِنَا أُمَّةً مُّسْلِمَةً لَّكَ وَأَرِنَا مَنَاسِكَنَا وَتُبْ عَلَيْنَا إِنَّكَ أَنتَ التَّوَّابُ الرَّحِيمُ",

"رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ",

"رَبَّنَا أَفْرِغْ عَلَيْنَا صَبْرًا وَثَبِّتْ أَقْدَامَنَا وَانصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ",

"سَمِعْنَا وَأَطَعْنَا غُفْرَانَكَ رَبَّنَا وَإِلَيْكَ الْمَصِيرُ",

"رَبَّنَا لَا تُؤَاخِذْنَا إِن نَّسِينَا أَوْ أَخْطَأْنَا وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنتَ مَوْلَانَا فَانصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ",

"رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِن لَّدُنكَ رَحْمَةً إِنَّكَ أَنتَ الْوَهَّابُ",

"رَبَّنَا إِنَّنَا آمَنَّا فَاغْفِرْ لَنَا ذُنُوبَنَا وَقِنَا عَذَابَ النَّارِ",

"اللَّهُمَّ مَالِكَ الْمُلْكِ تُؤْتِي الْمُلْكَ مَن تَشَاء وَتَنزِعُ الْمُلْكَ مِمَّن تَشَاء",

"رَبِّ هَبْ لِي مِن لَّدُنكَ ذُرِّيَّةً طَيِّبَةً إِنَّكَ سَمِيعُ الدُّعَاء",

"رَبَّنَا آمَنَّا بِمَا أَنزَلْتَ وَاتَّبَعْنَا الرَّسُولَ فَاكْتُبْنَا مَعَ الشَّاهِدِينَ",

"رَبَّنَا اغْفِرْ لَنَا ذُنُوبَنَا وَإِسْرَافَنَا فِي أَمْرِنَا",
"رَبَّنَا مَا خَلَقْتَ هَذَا بَاطِلًا سُبْحَانَكَ فَقِنَا عَذَابَ النَّارِ",

"رَبَّنَا أَخْرِجْنَا مِنْ هَذِهِ الْقَرْيَةِ الظَّالِمِ أَهْلُهَا",

"رَبَّنَا ظَلَمْنَا أَنفُسَنَا وَإِن لَّمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ الْخَاسِرِينَ",

"رَبِّ اغْفِرْ لِي وَلِأَخِي وَأَدْخِلْنَا فِي رَحْمَتِكَ",

"فَاطِرَ السَّمَاوَاتِ وَالْأَرْضِ أَنتَ وَلِيِّي فِي الدُّنْيَا وَالْآخِرَةِ",

"رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِن ذُرِّيَّتِي",

"رَبِّ اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ",

"رَّبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا",

"رَبِّ أَدْخِلْنِي مُدْخَلَ صِدْقٍ",

"رَبَّنَا آتِنَا مِن لَّدُنكَ رَحْمَةً",

"رَبِّ اشْرَحْ لِي صَدْرِي وَيَسِّرْ لِي أَمْرِي",

"رَّبِّ زِدْنِي عِلْمًا",

"مَسَّنِيَ الضُّرُّ وَأَنتَ أَرْحَمُ الرَّاحِمِينَ",

"لَا إِلَهَ إِلَّا أَنتَ سُبْحَانَكَ إِنِّي كُنتُ مِنَ الظَّالِمِينَ",

"رَبِّ لَا تَذَرْنِي فَرْدًا وَأَنتَ خَيْرُ الْوَارِثِينَ",

"رَبِّ أَعُوذُ بِكَ مِنْ هَمَزَاتِ الشَّيَاطِينِ",

"رَبَّنَا اصْرِفْ عَنَّا عَذَابَ جَهَنَّمَ",

"رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ",

"رَبِّ أَوْزِعْنِي أَنْ أَشْكُرَ نِعْمَتَكَ",

"رَبِّ إِنِّي ظَلَمْتُ نَفْسِي فَاغْفِرْ لِي",

"رَبِّ انصُرْنِي عَلَى الْقَوْمِ الْمُفْسِدِينَ",

"رَبَّنَا اغْفِرْ لَنَا وَلِإِخْوَانِنَا الَّذِينَ سَبَقُونَا بِالْإِيمَانِ",

"رَبَّنَا عَلَيْكَ تَوَكَّلْنَا وَإِلَيْكَ أَنَبْنَا",

"رَبِّ ابْنِ لِي عِندَكَ بَيْتًا فِي الْجَنَّةِ",

"رَبِّ اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ وَالْمُؤْمِنَاتِ"
];

  @override
  void initState() {
    super.initState();
    initHive();
  }

Future<void> initHive() async {
  await Hive.initFlutter();
  box = await Hive.openBox('duaasBox');

  DateTime today = DateTime.now();
  String todayString = "${today.year}-${today.month}-${today.day}";

  String? savedDate = box.get('lastDate');
  List<dynamic>? savedRead = box.get('readStatus');

  if (savedDate != todayString || savedRead == null) {
    // اليوم جديد أو لا توجد بيانات سابقة
    read2 = List.filled(duas.length, false);
    await box.put('readStatus', read2);
    await box.put('lastDate', todayString);
  } else {
    read2 = savedRead.cast<bool>();
    // إذا تغير طول الأدعية، عدّل read2 لتتطابق مع طول duas
    if (read2.length != duas.length) {
      if (read2.length < duas.length) {
        // أضف قيم false لبقية الأدعية الجديدة
        read2.addAll(List.filled(duas.length - read2.length, false));
      } else {
        // قص العناصر الزائدة إذا قلة الأدعية
        read2 = read2.sublist(0, duas.length);
      }
      await box.put('readStatus', read2);
    }
  }

  setState(() {});
}

  void markAsRead(int index) {
    setState(() {
      read2[index] = true;
      box.put('readStatus', read2);
    });
  }

  @override
  Widget build(BuildContext context) {
      if (read2.isEmpty) {
    return const Scaffold(
      backgroundColor: Color(0xff222933),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
    

    return Scaffold(
      appBar: AppBar(
         leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 24,)),
        backgroundColor: Color(0xff222933),
        centerTitle: true,
        title: Text("أدعية من القرآن",style: TextStyle
        (color: const Color(0xffFFFFFF),fontWeight: FontWeight.bold,fontSize: 24),),),
      
      backgroundColor: const Color(0xff222933),
      body: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
        

        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
             
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: duas.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        markAsRead(index);
                         showDialog(context: context, builder: (context){
                  return AlertDialog(
        
                    content:Text(
                                  duas[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff222933),
                                    fontFamily: "Merriweather_36pt",
                                    fontSize: 24,
                                  ),
                
                                ),
                    
                  );
                });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff222933),
                            borderRadius: BorderRadius.circular(70),
                            border: Border.all(color:read2[index]?Colors.green:
                             const Color(0xffffd364),
                              width: 1),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  duas[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Merriweather_36pt",
                                    fontSize: 18,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              const SizedBox(width: 8),
                              read2[index]
                                  ? const Icon(Icons.check, size: 40, color: Color(0xffffd364))
                                  : CircleAvatar(
                                      backgroundColor: const Color(0xffffd364),
                                      child: const Icon(
                                        Icons.visibility,
                                        color: Color(0xff222933),
                                        size: 28,
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}