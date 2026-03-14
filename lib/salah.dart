import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DeadDuaas extends StatefulWidget {
  const DeadDuaas({super.key});

  @override
  State<DeadDuaas> createState() => _DeadDuaasState();
}

class _DeadDuaasState extends State<DeadDuaas> {

  late List<bool> read;
  late Box box;
  bool isLoading = true;

  List<String> duas = [
    "أَسْـتَغْفِرُ الله، أَسْـتَغْفِرُ الله، أَسْـتَغْفِرُ الله. اللّهُـمَّ أَنْـتَ السَّلامُ ، وَمِـنْكَ السَّلام ، تَبارَكْتَ يا ذا الجَـلالِ وَالإِكْـرام . ",
    "لا إلهَ إلاّ اللّهُ وحدَهُ لا شريكَ لهُ، لهُ المُـلْكُ ولهُ الحَمْد، وهوَ على كلّ شَيءٍ قَدير",
    "لا إلهَ إلاّ اللّه, وحدَهُ لا شريكَ لهُ، لهُ الملكُ ولهُ الحَمد، وهوَ على كلّ شيءٍ قدير",
    "سُـبْحانَ اللهِ، والحَمْـدُ لله ، واللهُ أكْـبَر",
    "لا إلهَ إلاّ اللّهُ وَحْـدَهُ لا شريكَ لهُ، لهُ الملكُ ولهُ الحَمْد",
    "قُلْ هُوَ ٱللَّهُ أَحَدٌ",
    "اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ",
    "لا إلهَ إلاّ اللّهُ وحْـدَهُ لا شريكَ لهُ",
    "اللّهُـمَّ إِنِّـي أَسْأَلُـكَ عِلْمـاً نافِعـاً",
    "اللَّهُمَّ أَجِرْنِي مِنْ النَّار",
    "اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ"
  ];

  @override
  void initState() {
    super.initState();
    initHive();
  }

  Future<void> initHive() async {

    await Hive.initFlutter();
    box = await Hive.openBox('duaasBox2');

    DateTime today = DateTime.now();
    String todayString = "${today.year}-${today.month}-${today.day}";

    String? savedDate = box.get('lastDate');
    List<dynamic>? savedRead = box.get('readStatus');

    if (savedDate != todayString || savedRead == null) {

      read = List.filled(duas.length, false);
      await box.put('readStatus', read);
      await box.put('lastDate', todayString);

    } else {

      read = savedRead.cast<bool>();
    }

    setState(() {
      isLoading = false;
    });
  }

  void markAsRead(int index) {

    setState(() {
      read[index] = true;
      box.put('readStatus', read);
    });

  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(

      backgroundColor: const Color(0xff222933),

      appBar: AppBar(

        backgroundColor: const Color(0xff222933),

        centerTitle: true,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
          onPressed: (){
            Navigator.pop(context);
          },
        ),

        title: Text(
          " بعد الصلاة",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: width * 0.055,
          ),
        ),
      ),

      body: Padding(

        padding: EdgeInsets.all(width * 0.04),

        child: ListView.builder(

          itemCount: duas.length,

          itemBuilder: (context,index){

            return InkWell(

              onTap: (){

                markAsRead(index);

                showDialog(

                  context: context,

                  builder: (context){

                    return AlertDialog(

                      content: SingleChildScrollView(

                        child: Text(

                          duas[index],

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff222933),
                            fontSize: width * 0.06,
                          ),

                        ),
                      ),

                    );

                  }

                );

              },

              child: Padding(

                padding: EdgeInsets.only(bottom: height * 0.02),

                child: Container(

                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.02,
                    horizontal: width * 0.04,
                  ),

                  decoration: BoxDecoration(

                    color: const Color(0xff222933),

                    borderRadius: BorderRadius.circular(width * 0.2),

                    border: Border.all(
                      color: read[index]
                          ? Colors.green
                          : const Color(0xffffd364),
                      width: 1.5,
                    ),

                  ),

                  child: Row(

                    children: [

                      Expanded(

                        child: Text(

                          duas[index],

                          textAlign: TextAlign.center,

                          maxLines: 1,

                          overflow: TextOverflow.ellipsis,

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.045,
                          ),

                        ),

                      ),

                      SizedBox(width: width * 0.02),

                      read[index]

                          ? Icon(
                              Icons.check,
                              size: width * 0.08,
                              color: const Color(0xffffd364),
                            )

                          : CircleAvatar(

                              radius: width * 0.045,

                              backgroundColor: const Color(0xffffd364),

                              child: Icon(
                                Icons.visibility,
                                color: const Color(0xff222933),
                                size: width * 0.05,
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

    );

  }
}