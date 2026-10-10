import 'package:flutter/material.dart';

void main() => runApp(const TumaneenaApp());

class TumaneenaApp extends StatelessWidget {
  const TumaneenaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'طُمَأْنِينَة',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF4F6F8),
        fontFamily: 'sans-serif',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طُمَأْنِينَة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        centerTitle: true,
        backgroundColor: Colors.teal.shade800,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade800, Colors.teal.shade600],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Text(
                    'أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6),
                  Text(
                    'دليل الشاب المؤمن • الأدعية، الزيارات، والمناجيات',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
              children: [
                _buildMenuCard(context, 'القرآن الكريم', Icons.menu_book_rounded, Colors.green, const QuranScreen()),
                _buildMenuCard(context, 'أوقات الصلاة', Icons.access_time_filled_rounded, Colors.amber.shade800, const PrayerTimesScreen()),
                _buildMenuCard(context, 'الأدعية والأذكار', Icons.menu_open_rounded, Colors.teal, const AzkarScreen()),
                _buildMenuCard(context, 'المناجيات الإلهية', Icons.volunteer_activism_rounded, Colors.indigo, const MunajatScreen()),
                _buildMenuCard(context, 'الزيارات الشريفة', Icons.mosque_rounded, Colors.brown, const ZeyaratScreen()),
                _buildMenuCard(context, 'فضائل المعصومين (ع)', Icons.auto_awesome_rounded, Colors.purple, const VirtuesScreen()),
                _buildMenuCard(context, 'شرف المؤمن (صلاة الليل)', Icons.nights_stay_rounded, Colors.deepPurple, const SalatAlLaylScreen()),
                _buildMenuCard(context, 'المسبحة الإلكترونية', Icons.touch_app_rounded, Colors.blue, const TasabeehScreen()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color color, Widget targetScreen) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => targetScreen)),
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: color.withOpacity(0.12),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 1. قسم القرآن الكريم
class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  final List<Map<String, String>> surahs = const [
    {'name': 'سورة الفاتحة', 'text': 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ ﴿١﴾ الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ ﴿٢﴾ الرَّحْمَٰنِ الرَّحِيمِ ﴿٣﴾ مَالِكِ يَوْمِ الدِّينِ ﴿٤﴾ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ ﴿٥﴾ اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ ﴿٦﴾ صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ ﴿٧﴾'},
    {'name': 'سورة يس', 'text': 'يس ﴿١﴾ وَالْقُرْآنِ الْحَكِيمِ ﴿٢﴾ إِنَّكَ لَمِنَ الْمُرْسَلِينَ ﴿٣﴾ عَلَىٰ صِرَاطٍ مُسْتَقِيمٍ ﴿٤﴾ تَنْزِيلَ الْعَزِيزِ الرَّحِيمِ ﴿٥﴾ لِتُنْذِرَ قَوْمًا مَا أُنْذِرَ آبَاؤُهُمْ فَهُمْ غَافِلُونَ...'},
    {'name': 'سورة الواقعة', 'text': 'إِذَا وَقَعَتِ الْوَاقِعَةُ ﴿١﴾ لَيْسَ لِوَقْعَتِهَا كَاذِبَةٌ ﴿٢﴾ خَافِضَةٌ رَافِعَةٌ ﴿٣﴾ إِذَا رُجَّتِ الْأَرْضُ رَجًّا ﴿٤﴾ وَبُسَّتِ الْجِبَالُ بَسًّا ﴿٥﴾ فَكَانَتْ هَبَاءً مُنْبَثًّا...'},
    {'name': 'سورة الملك', 'text': 'تَبَارَكَ الَّذِي بِيَدِهِ الْمُلْكُ وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ ﴿١﴾ الَّذِي خَلَقَ الْمَوْتَ وَالْحَيَاةَ لِيَبْلُوَكُمْ أَيُّكُمْ أَحْسَنُ عَمَلًا وَهُوَ الْعَزِيزُ الْغَفُورُ...'},
    {'name': 'سورة الرحمن', 'text': 'الرَّحْمَٰنُ ﴿١﴾ عَلَّمَ الْقُرْآنَ ﴿٢﴾ خَلَقَ الْإِنْسَانَ ﴿٣﴾ عَلَّمَهُ الْبَيَانَ ﴿٤﴾ الشَّمْسُ وَالْقَمَرُ بِحُسْبَانٍ...'},
    {'name': 'سورة الإخلاص', 'text': 'قُلْ هُوَ اللَّهُ أَحَدٌ ﴿١﴾ اللَّهُ الصَّمَدُ ﴿٢﴾ لَمْ يَلِدْ وَلَمْ يُولَدْ ﴿٣﴾ وَلَمْ يَكُنْ لَهُ كُفُوًا أَحَدٌ ﴿٤﴾'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('سور القرآن الكريم'), backgroundColor: Colors.green),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: surahs.length,
        itemBuilder: (_, i) => Card(
          child: ExpansionTile(
            leading: CircleAvatar(backgroundColor: Colors.green.shade100, child: Text('${i + 1}', style: const TextStyle(color: Colors.green))),
            title: Text(surahs[i]['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(surahs[i]['text']!, style: const TextStyle(fontSize: 16, height: 1.8), textAlign: TextAlign.right),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 2. أوقات الصلاة الشرعية
class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أوقات الصلاة الشرعية'), backgroundColor: Colors.amber.shade800),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _item('الفجر', '04:35 ص', Icons.wb_twilight),
            _item('الشروق', '06:02 ص', Icons.wb_sunny),
            _item('الظهر', '11:58 ص', Icons.sunny),
            _item('العصر', '03:20 م', Icons.wb_cloudy),
            _item('المغرب الشرعي', '06:22 م', Icons.nights_stay),
            _item('العشاء', '07:10 م', Icons.bedtime),
            _item('منتصف الليل الشرعي', '11:28 م', Icons.access_time),
          ],
        ),
      ),
    );
  }

  Widget _item(String title, String time, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.amber.shade900),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(time, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
      ),
    );
  }
}

// 3. الأدعية والأذكار
class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  final List<Map<String, String>> data = const [
    {'title': 'دعاء كميل', 'text': 'اللَّهُمَّ إِنِّي أَسْأَلُكَ بِرَحْمَتِكَ الَّتِي وَسِعَتْ كُلَّ شَيْءٍ، وَبِقُوَّتِكَ الَّتِي قَهَرْتَ بِهَا كُلَّ شَيْءٍ، وَخَضَعَ لَهَا كُلُّ شَيْءٍ، وَذَلَّ لَهَا كُلُّ شَيْءٍ، وَبِجَبَرُوتِكَ الَّتِي غَلَبْتَ بِهَا كُلَّ شَيْءٍ، وَبِعِزَّتِكَ الَّتِي لا يَقُومُ لَهَا شَيْءٌ...'},
    {'title': 'دعاء العهد', 'text': 'اللَّهُمَّ رَبَّ النُّورِ الْعَظِيمِ، وَرَبَّ الْكُرْسِيِّ الرَّفِيعِ، وَرَبَّ الْبَحْرِ الْمَسْجُورِ، وَمُنْزِلَ التَّوْرَاةِ وَالإنْجِيلِ وَالزَّبُورِ، وَرَبَّ الظِّلِّ وَالْحَرُورِ، وَمُنْزِلَ الْقُرْآنِ الْعَظِيمِ...'},
    {'title': 'دعاء التوسل', 'text': 'اللَّهُمَّ إِنِّي أَسْأَلُكَ وَأَتَوَجَّهُ إِلَيْكَ بِنَبِيِّكَ نَبِيِّ الرَّحْمَةِ مُحَمَّدٍ صَلَّى اللَّهُ عَلَيْهِ وَآلِهِ، يَا أَبَا الْقَاسِمِ، يَا رَسُولَ اللَّهِ، يَا إِمَامَ الرَّحْمَةِ...'},
    {'title': 'دعاء الصباح', 'text': 'اللَّهُمَّ يَا مَنْ دَلَعَ لِسَانَ الصَّبَاحِ بِنُطْقِ تَبَلُّجِهِ، وَسَرَّحَ قِطَعَ اللَّيْلِ الْمُظْلِمِ بِغَاهِيَبِ تَلَجْلُجِهِ، وَأَتْقَنَ صُنْعَ الْفَلَكِ الدَّوَّارِ فِي مَقَادِيرِ تَبَرُّجِهِ...'},
    {'title': 'دعاء زمن الغيبة', 'text': 'اللَّهُمَّ عَرِّفْنِي نَفْسَكَ، فَإِنَّكَ إِنْ لَمْ تُعَرِّفْنِي نَفْسَكَ لَمْ أَعْرِفْ نَبِيَّكَ، اللَّهُمَّ عَرِّفْنِي رَسُولَكَ فَإِنَّكَ إِنْ لَمْ تُعَرِّفْنِي رَسُولَكَ لَمْ أَعْرِفْ حُجَّتَكَ...'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الأدعية المباركة'), backgroundColor: Colors.teal),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: data.length,
        itemBuilder: (_, i) => Card(
          child: ExpansionTile(
            title: Text(data[i]['title']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(data[i]['text']!, style: const TextStyle(fontSize: 15, height: 1.7)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 4. المناجيات الخمس عشرة
class MunajatScreen extends StatelessWidget {
  const MunajatScreen({super.key});

  final List<Map<String, String>> munajatList = const [
    {'title': '1. مناجاة التائبين', 'text': 'إِلهِي أَلْبَسَتْنِي الْخَطايا ثَوْبَ مَذَلَّتِي، وَجَلَّلَنِي التَّباُعُدُ مِنْكَ لِباسَ مَسْكَنَتِي، وَأَماتَ كَبِيرَ جِنايَتِي قَلْبِي، فَأَحْيِهِ بِتَوْبَةٍ مِنْكَ يَا أَمَلِي وَبُغْيَتِي...'},
    {'title': '2. مناجاة الشاكين', 'text': 'إِلهِي إِلَيْكَ أَشْكُو نَفْساً بِالسُّوءِ أَمَّارَةً، وَإِلَى الْخَطِيئَةِ مُبادِرَةً، وَبِمَعاصِيكَ مُولَعَةً، وَلِسَخَطِكَ مُتَعَرِّضَةً، تَسْلُكُ بِي مَسالِكَ الْمَهَالِكِ...'},
    {'title': '3. مناجاة الخائفين', 'text': 'إِلهِي أَتَراني بَعْدَ الإِيْمانِ بِكَ تُعَذِّبُنِي، أَمْ بَعْدَ حُبِّي إِيَّاكَ تُبَعِّدُنِي، أَمْ مَعَ رَجائِي لِرَحْمَتِكَ وَصَفْحِكَ تُخَيِّبُنِي، أَمْ مَعَ اسْتِجارَتِي بِعَفْوِكَ تُسْلِمُنِي...'},
    {'title': '4. مناجاة الراجين', 'text': 'يا مَنْ إِذا سَأَلَهُ عَبْدٌ أَعْطاهُ، وَإِذا أَمَّلَ ما عِنْدَهُ بَلَّغَهُ مُناهُ، وَإِذا أَقْبَلَ عَلَيْهِ قَرَّبَهُ وَأَدْناهُ...'},
    {'title': '5. مناجاة الراغبين', 'text': 'إِلهِي إِنْ كانَ قَلَّ زادِي فِي المَسِيرِ إِلَيْكَ، فَلَقَدْ حَسُنَ ظَنِّي بِالتَّوَكُّلِ عَلَيْكَ...'},
    {'title': '6. مناجاة الشاكرين', 'text': 'إِلهِي ذَهَلَ ذُهولُ بَواهِرِ آلاءِكَ عَنْ حَمْدِكَ، وَعَجَزَ فَيْضُ فَضْلِكَ عَنْ إِحْصاءِ ثَنائِكَ...'},
    {'title': '7. مناجاة المطيعين لله', 'text': 'اللَّهُمَّ أَلْهِمْنا طاعَتَكَ، وَجَنِّبْنا مَعْصِيَتَكَ، وَيَسِّرْ لَنا بُلُوغَ ما نَتَمَنَّى مِنْ ابْتِغاءِ رِضْوانِكَ...'},
    {'title': '8. مناجاة المريدين', 'text': 'سُبْحانَكَ ما أَضْيَقَ الطُّرُقَ عَلى مَنْ لَمْ تَكُنْ دَلِيلَهُ! وَما أَوْضَحَ الحَقَّ عِنْدَ مَنْ هَدَيْتَهُ سَبِيلَهُ!'},
    {'title': '9. مناجاة المحبين', 'text': 'إِلهِي مَنْ ذَا الَّذِي ذاقَ حَلاوَةَ مَحَبَّتِكَ فَرامَ مِنْكَ بَدَلاً؟ وَمَنْ ذَا الَّذِي أَنِسَ بِقُرْبِكَ فَابْتَغى عَنْكَ حِوَلاً؟'},
    {'title': '10. مناجاة المتوسلين', 'text': 'إِلهِي لَيْسَ لِي وَسِيلَةٌ إِلَيْكَ إِلاّ عَواطِفُ رَأْفَتِكَ، وَلا لِي ذَرِيعَةٌ إِلَيْكَ إِلاّ عَوارِفُ رَحْمَتِكَ...'},
    {'title': '11. مناجاة المفتقرين', 'text': 'إِلهِي كَسْرِي لا يَجْبُرُهُ إِلاّ لُطْفُكَ وَحَنانُكَ، وَفَقْرِي لا يُغْنِيهِ إِلاّ عَطْفُكَ وَإِحْسانُكَ...'},
    {'title': '12. مناجاة العارفين', 'text': 'إِلهِي قَصُرَتِ الأَلْسُنُ عَنْ تَشْرِيفِ ثَنائِكَ كَما يَلِيقُ بِجَلالِكَ، وَعَجَزَتِ العُقُولُ عَنْ إِدْراكِ كُنْهِ جَمالِكَ...'},
    {'title': '13. مناجاة الذاكرين', 'text': 'إِلهِي لَوْلا الواجِبُ مِنْ قَبُولِ أَمْرِكَ لَنَزَّهْتُكِ مِنْ ذِكْرِي إِيَّاكَ، عَلى أَنَّ ذِكْرِي لَكَ بِقَدْرِي لا بِقَدْرِكَ...'},
    {'title': '14. مناجاة المعتصمين', 'text': 'اللَّهُمَّ يا مَلاذَ اللاَّئِذِينَ، وَيا مَعاذا المَياذِينَ، وَيا مُنْجِيَ الهالِكِينَ، وَيا عاصِمَ البائِسِينَ...'},
    {'title': '15. مناجاة الزاهدين', 'text': 'إِلهِي أَسْكَنْتَنا داراً حَفَرَتْ لَنا حُفَرَ مَكْرِها، وَعَلَّقَتْنا بِأَيْدِي المَنايا فِي حَبائِلِ غَدْرِها...'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المناجيات الخمس عشرة'), backgroundColor: Colors.indigo),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: munajatList.length,
        itemBuilder: (_, i) => Card(
          child: ExpansionTile(
            title: Text(munajatList[i]['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(munajatList[i]['text']!, style: const TextStyle(fontSize: 15, height: 1.7)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 5. الزيارات الشريفة
class ZeyaratScreen extends StatelessWidget {
  const ZeyaratScreen({super.key});

  final List<Map<String, String>> zeyaratData = const [
    {'title': 'زيارة عاشوراء', 'text': 'السَّلامُ عَلَيْكَ يَا أَبَا عَبْدِ اللَّهِ، السَّلامُ عَلَيْكَ يَا ابْنَ رَسُولِ اللَّهِ، السَّلامُ عَلَيْكَ يَا خِيَرَةَ اللَّهِ وَابْنَ خِيَرَتِهِ، السَّلامُ عَلَيْكَ يَا ابْنَ أَمِيرِ الْمُؤْمِنِينَ وَابْنَ سَيِّدِ الْوَصِيِّينَ، السَّلامُ عَلَيْكَ يَا ابْنَ فَاطِمَةَ سَيِّدَةِ نِسَاءِ الْعَالَمِينَ...'},
    {'title': 'زيارة أمين الله', 'text': 'السَّلامُ عَلَيْكَ يَا أَمِينَ اللَّهِ فِي أَرْضِهِ، وَحُجَّتَهُ عَلَى عِبَادِهِ، السَّلامُ عَلَيْكَ يَا أَمِيرَ الْمُؤْمِنِينَ، أَشْهَدُ أَنَّكَ جَاهَدْتَ فِي اللَّهِ حَقَّ جِهَادِهِ، وَعَمِلْتَ بِكِتَابِهِ، وَاتَّبَعْتَ سُنَنَ نَبِيِّهِ صَلَّى اللَّهُ عَلَيْهِ وَآلِهِ...'},
    {'title': 'زيارة آل ياسين', 'text': 'سَلامٌ عَلَى آلِ يس، السَّلامُ عَلَيْكَ يَا دَاعِيَ اللَّهِ وَرَبَّانِيَّ آيَاتِهِ، السَّلامُ عَلَيْكَ يَا بَابَ اللَّهِ وَدَيَّانَ دِينِهِ، السَّلامُ عَلَيْكَ يَا خَلِيفَةَ اللَّهِ وَنَاصِرَ حَقِّهِ، السَّلامُ عَلَيْكَ يَا حُجَّةَ اللَّهِ وَدَلِيلَ إِرَادَتِهِ...'},
    {'title': 'زيارة الجامعة الكبيرة', 'text': 'سَلامٌ عَلَى أَوْلِيَاءِ اللَّهِ وَأَصْفِيَائِهِ، السَّلامُ عَلَيْكَ يَا أَمَنَةَ اللَّهِ فِي بِلاَدِهِ وَحُجَجَهُ عَلَى عِبَادِهِ، السَّلامُ عَلَيْكُمْ يَا أَهْلَ بَيْتِ النُّبُوَّةِ وَمَوْضِعَ الرِّسَالَةِ وَمُخْتَلَفَ المَلائِكَةِ...'},
    {'title': 'زيارة وارث', 'text': 'السَّلامُ عَلَيْكَ يَا وَارِثَ آدَمَ صَفْوَةِ اللَّهِ، السَّلامُ عَلَيْكَ يَا وَارِثَ نُوحٍ نَبِيِّ اللَّهِ، السَّلامُ عَلَيْكَ يَا وَارِثَ إِبْرَاهِيمَ خَلِيلِ اللَّهِ...'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الزيارات الشريفة الكاملة'), backgroundColor: Colors.brown),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: zeyaratData.length,
        itemBuilder: (_, i) => Card(
          child: ExpansionTile(
            title: Text(zeyaratData[i]['title']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown)),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(zeyaratData[i]['text']!, style: const TextStyle(fontSize: 15, height: 1.7)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 6. فضائل المعصومين الأربعة عشر (ع)
class VirtuesScreen extends StatelessWidget {
  const VirtuesScreen({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      'm': 'رسول الله محمد (صلّى الله عليه وآله)',
      'v': [
        '1. خاتم النبيين والمرسلين وأشرف الخلق أجمعين.',
        '2. صاحب الخُلُق العظيم وشهد له القران الكريم بذلك.',
        '3. صاحب شفاعة يوم القيامة العظمى للجميع.',
        '4. أُرسِل رحمة للعالمين بشيراً ونذيراً.',
        '5. صاحب المعجزة الخالدة: القرآن الكريم.',
        '6. العروج إلى السماء في حادثة الإسراء والمعراج.',
        '7. تأسيس دولة الإسلام على قيم العدالة والمواطنة.',
        '8. كسر الأصنام وتطهير الكعبة المشرفة.',
        '9. المؤاخاة بين المسلمين وإرساء قواعد الأخوة.',
        '10. إبلاغ ولاية أمير المؤمنين (ع) في يوم غدير خم.'
      ]
    },
    {
      'm': 'الإمام علي بن أبي طالب (عليه السلام)',
      'v': [
        '1. وليد الكعبة المشرفة ولم يولد فيها غيره.',
        '2. أول من آمن بالرسول (ص) وصلّى معه.',
        '3. المبيت في فراش النبي (ص) ليلة الهجرة (الفداء).',
        '4. قائد وشجاع معارك بدر وأحد وحنين وخيبر.',
        '5. قسيم الجنة والنار وصاحب لواء الحمد.',
        '6. باب مدينة علم الرسول (ص).',
        '7. الأخ والوصي والخليفة الشرعي يوم الغدير.',
        '8. التصدق بالخاتم أثناء الركوع ونزول آية الولاية فيه.',
        '9. الزهد التام وعدم الانغماس في ملاذ الدنيا.',
        '10. كافل الأيتام والمساكين والمستضعفين.'
      ]
    },
    {
      'm': 'السيدة فاطمة الزهراء (عليها السلام)',
      'v': [
        '1. سيدة نساء العالمين من الأولين والآخرين.',
        '2. أم أبيها وبضعة النبي المصطفى (ص).',
        '3. نزول سورة الكوثر في فضلها ومكانتها.',
        '4. رضا الله من رضاها وغضبه من غضبها.',
        '5. سيدة أصحاب الكساء ومحور طهارتهم.',
        '6. التسبيح المنسوب باسمها (تسبيح الزهراء).',
        '7. الصبر والجهاد للدفاع عن ولاية أمير المؤمنين.',
        '8. إيثار الفقراء والمساكين بطعامها 3 أيام متتالية.',
        '9. شفاعتها العظمى لمحبيها يوم القيامة.',
        '10. الكفوء الوحيد لأمير المؤمنين علي (ع).'
      ]
    },
    {
      'm': 'الإمام الحسن المجتبى (عليه السلام)',
      'v': [
        '1. سبط النبي الأكبر وسيد شباب أهل الجنة.',
        '2. أشبه الناس برسول الله خَلقاً وخُلقاً.',
        '3. كريم أهل البيت لكثرة سخائه وإنفاقه.',
        '4. خرج من ماله مرتين وقاسم الله ماله ثلاث مرات.',
        '5. عقد صلح الهدنة لحفظ دماء المسلمين وتعرية النفاق.',
        '6. حليم آل محمد في التعامل مع المسيء.',
        '7. شجاعته الفائقة في معارك الجمل وصفين.',
        '8. إفشال مخططات الفتنة ببصيرته العالية.',
        '9. إمام قام أو قعد بنص الرسول المصطفى (ص).',
        '10. إعمار مجلس العلم والتفسير في المدينة.'
      ]
    },
    {
      'm': 'الإمام الحسين الشهيد (عليه السلام)',
      'v': [
        '1. سيد الشهداء وسيد شباب أهل الجنة.',
        '2. "حسين مني وأنا من حسين" نص نبوي مبارك.',
        '3. مصباح الهدى وسفينة النجاة.',
        '4. القائد والرمز الأول لرفض الظلم والفساد.',
        '5. الشفاء في تربته واستجابة الدعاء تحت قبته.',
        '6. جعل الله الأئمة من ذريته بنص الرسول (ص).',
        '7. التضحية بالنفس والأهل والعيال لحفظ الدين.',
        '8. نهضة كربلاء الملهمة لكل أحرار العالم.',
        '9. البكاء عليه يوجب غفران الذنوب والرحمة.',
        '10. باب الحوائج العظيم لكل مكروب ومحتاج.'
      ]
    },
    {
      'm': 'الإمام علي بن الحسين السجاد (عليه السلام)',
      'v': [
        '1. زين العابدين وسيد الساجدين.',
        '2. صاحب الصحيفة السجادية (زبور آل محمد).',
        '3. مؤلف رسالة الحقوق التي أسست لحقوق الإنسان.',
        '4. كفالة مئات العوائل الفقيرة سراً في الليل.',
        '5. البكاء الصادق ونشر مظلومية عاشوراء.',
        '6. العبادة والتهجد الطويل حتى ورمت قدماه.',
        '7. الفصاحة والخطبة التاريخية في بلاط الشام.',
        '8. الحلم وسعة الصدر والعفو عند المقدرة.',
        '9. إعتاق العبيد وتربيتهم إسلامياً وفكرياً.',
        '10. حفظ امتداد الإمامة الإلهية بعد كربلاء.'
      ]
    },
    {
      'm': 'الإمام محمد بن علي الباقر (عليه السلام)',
      'v': [
        '1. باقر علوم النبيين وشاق العلم شقاً.',
        '2. إبلاغ سلام الرسول (ص) له عبر جابر الأنصاري.',
        '3. تأسيس الجامعة الإسلامية الكبرى بالمدينة.',
        '4. تربية الآلاف من الفقهاء والرواة والعلماء.',
        '5. نشر علوم الفقه والتفسير والكلام.',
        '6. الجود والكرم وإطعام الطعام للمستحقين.',
        '7. عبادته وخشوعه البالغ في محرابه.',
        '8. الشجاعة في إظهار الحق ومواجهة الانحراف.',
        '9. الحكمة والوعظ في إدارة الأزمات والفتن.',
        '10. إحياء تراث وأحكام أهل البيت وتوثيقها.'
      ]
    },
    {
      'm': 'الإمام جعفر بن محمد الصادق (عليه السلام)',
      'v': [
        '1. رئيس المذهب الجعفري وناشر علومه.',
        '2. تخرج على يديه أكثر من 4000 عالم ومفكر.',
        '3. إرساء قواعد الفقه والشريعة الإسلامية.',
        '4. مناظراته العلمية المنتصرة مع الفلاسفة.',
        '5. التواضع الشديد مع الفقراء وعامة الناس.',
        '6. الحث على زيارة الإمام الحسين (ع) وتأسيس الشعائر.',
        '7. الصدق والأمانة التي شهد لها الأعداء قبل الأصدقاء.',
        '8. اتساع الحركة العلمية والطبية في عهده.',
        '9. الأدعية والمناجيات الراقية المأثورة عنه.',
        '10. التصدق بالليل وسراً على المحتاجين.'
      ]
    },
    {
      'm': 'الإمام موسى بن جعفر الكاظم (عليه السلام)',
      'v': [
        '1. الكاظم للغيظ والعافي عن الناس.',
        '2. العبد الصالح وأعبد أهل زمانه.',
        '3. حليف السجدة الطويلة والدمعة الغزيرة.',
        '4. باب الحوائج إلى الله تعالى.',
        '5. الصبر العظيم في طوامير السجون المظلمة.',
        '6. تحويل السجن إلى محراب للعبادة والذكر.',
        '7. إنفاق الأموال وصِرار المطبخ المضروب بها المثل.',
        '8. هداية السجانين بأخلاقه وعبادته النورانية.',
        '9. العلم الواسع والرد على الشبهات والأسئلة.',
        '10. الحفاظ على التنظيم السري والتواصل مع المؤمنين.'
      ]
    },
    {
      'm': 'الإمام علي بن موسى الرضا (عليه السلام)',
      'v': [
        '1. عالم آل محمد بنص الآباء والأجداد.',
        '2. غريب الغرباء والضامن للزوار.',
        '3. مناظراته الشهيرة المنتصرة مع رؤوس الأديان والملل.',
        '4. قبول ولاية العهد بفرضه لحقن دماء المؤمنين.',
        '5. صلاة العيد المشهورة التي هزت الخلافة.',
        '6. الأخلاق الرفيعة وعدم جرح مشاعر أحد.',
        '7. حديث سلسلة الذهب عن التوحيد والولاية.',
        '8. إكرام العلماء والشعراء (كدعبل الخزاعي).',
        '9. الرأفة العظيمة بزوار مراقده الشريفة.',
        '10. نشر علوم ومظلومية أهل البيت في أرجاء خراسان.'
      ]
    },
    {
      'm': 'الإمام محمد بن علي الجواد (عليه السلام)',
      'v': [
        '1. باب المراد وجواد الأئمة.',
        '2. الإمامة المبكرة في سن السابعة بكفاءة إلهية.',
        '3. إفحام قاضي القضاة يحيى بن أكثم في المناظرة.',
        '4. الجود والسخاء الفائق على السائلين.',
        '5. العلم اللدنّي والرد على آلاف المسائل في مجلس واحد.',
        '6. الشجاعة والصلابة أمام ضغوط السلطة.',
        '7. الهيبة والوقار الهائل في صغر سنه.',
        '8. العبادة المستمرة والتعقيبات المباركة.',
        '9. الاهتمام بالشباب ورعايتهم علمياً وعقائدياً.',
        '10. أعظم بركة على الشيعة بنص الإمام الرضا (ع).'
      ]
    },
    {
      'm': 'الإمام علي بن محمد الهادي (عليه السلام)',
      'v': [
        '1. صاحب الزيارة الجامعة الكبيرة النورانية.',
        '2. النقي الهادي والدليل إلى الله.',
        '3. إفشال محاولات المتوكل العباسي لإهانته.',
        '4. استجابة الدعاء السريعة عند مرقده الشريف.',
        '5. إثبات الكرامات والمعاجز الظاهرة.',
        '6. إدارة شبكة الوكلاء بنجاح وحكمة.',
        '7. العبادة والزهد على حصير في غرفة خالية.',
        '8. الهيبة الإلهية التي تخضع لها القلوب.',
        '9. نشر التفسير والتوجيه العقائدي السليم.',
        '10. الصبر على الإقامة الجبرية في سامراء.'
      ]
    },
    {
      'm': 'الإمام الحسن بن علي العسكري (عليه السلام)',
      'v': [
        '1. والد الإمام المهدي المنتظر (عجل الله فرجه).',
        '2. الزكي والعسكري المرابط على الحق.',
        '3. التفسير المنسوب إليه والمليء بالحقائق.',
        '4. التمهيد والتهيئة لغيبة الإمام المهدي (عج).',
        '5. الصبر على المراقبة الشديدة في السجن.',
        '6. كرمه وإغناء الفقراء بكتابة الصكوك.',
        '7. خشوع العبادة التي أثرت في الحراس والسجانين.',
        '8. إفشال حيل الكندي الفيلسوف في تناقض القرآن.',
        '9. توجيه أتباعه بالالتزام بالورع والصدق.',
        '10. الجمال والهيبة والوقار النبوي.'
      ]
    },
    {
      'm': 'الإمام المهدي المنتظر (عجل الله فرجه)',
      'v': [
        '1. القائم بأمر الله والمنتقم لآل محمد.',
        '2. يملأ الأرض قسطاً وعدلاً كما ملئت ظلماً وجوراً.',
        '3. صاحب العصمة والولاية التكوينية العظمى.',
        '4. بقية الله في أرضه والحجة الحية على عباده.',
        '5. خروج عيسى بن مريم (ع) والصلاة خلفه.',
        '6. توحيد العالم تحت راية التوحيد والعدل الإلهي.',
        '7. إخراج كنز الأرض وعلوم الأنبياء بالكامل.',
        '8. الدعاء للمؤمنين ورعايتهم في زمن الغيبة.',
        '9. الشبيبة الخالدة عند ظهوره الشريف.',
        '10. تحقيق أمل جميع الأنبياء والمرسلين طوال التاريخ.'
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('10 فضائل لكل معصوم (ع)'), backgroundColor: Colors.purple),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (_, i) => Card(
          child: ExpansionTile(
            leading: const Icon(Icons.star, color: Colors.amber),
            title: Text(items[i]['m'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            children: (items[i]['v'] as List<String>).map((x) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Align(alignment: Alignment.centerRight, child: Text(x, style: const TextStyle(fontSize: 13, height: 1.4))),
            )).toList(),
          ),
        ),
      ),
    );
  }
}

// 7. قسم "شرف المؤمن" (صلاة الليل)
class SalatAlLaylScreen extends StatelessWidget {
  const SalatAlLaylScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('شرف المؤمن (صلاة الليل)'), backgroundColor: Colors.deepPurple),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Colors.deepPurple.shade50, borderRadius: BorderRadius.circular(12)),
            child: const Text(
              '﴿ وَمِنَ اللَّيْلِ فَتَهَجَّدْ بِهِ نَافِلَةً لَّكَ عَسَىٰ أَن يَبْعَثَكَ رَبُّكَ مَقَامًا مَّحْمُودًا ﴾',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 14),
          const Text('أقوال وآثار صلاة الليل:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
          const SizedBox(height: 6),
          const Card(child: ListTile(title: Text('رسول الله (ص):'), subtitle: Text('"شرف المؤمن صلاته بالليل، وعزه كف الأذى عن الناس".'))),
          const Card(child: ListTile(title: Text('الإمام الصادق (ع):'), subtitle: Text('"صلاة الليل تبيض الوجه، وتذهب بالهم، وتجلب الرزق".'))),
          const Card(child: ListTile(title: Text('أمير المؤمنين (ع):'), subtitle: Text('"قيام الليل مصحة للبدن وموجبة لمرضاة الرب".'))),
          const SizedBox(height: 14),
          const Text('كيفية صلاة الليل (11 ركعة):', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
          const SizedBox(height: 6),
          const Card(child: ListTile(title: Text('1. نافلة الليل (8 ركعات)'), subtitle: Text('تُصلى ركعتين ركعتين بنية نافلة الليل كصلاة الصبح (4 مرات).'))),
          const Card(child: ListTile(title: Text('2. ركعتا الشفع (ركعتان)'), subtitle: Text('تُصلى ركعتين متصلتين دون قنوت، يقرأ فيها الفاتحة والناس/الفلق.'))),
          const Card(child: ListTile(title: Text('3. ركعة الوتر (ركعة واحدة)'), subtitle: Text('ركعة واحدة يُقرأ فيها الفاتحة والتوحيد 3 مرات والمعوذتين، ثم القنوت والاستغفار 70 مرة والدعاء لـ 40 مؤمناً.'))),
          const Card(child: ListTile(title: Text('💡 للمستعجل أو المتعب:'), subtitle: Text('يمكن الاقتصار على الشفع والوتر (3 ركعات) أو الوتر وحدها قبل الفجر!'))),
        ],
      ),
    );
  }
}

// 8. المسبحة الإلكترونية التفاعلية
class TasabeehScreen extends StatefulWidget {
  const TasabeehScreen({super.key});

  @override
  State<TasabeehScreen> createState() => _TasabeehState();
}

class _TasabeehState extends State<TasabeehScreen> {
  int _counter = 0;
  String _currentZikr = 'سُبْحَانَ اللَّهِ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المسبحة الإلكترونية'), backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: _currentZikr,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
              items: <String>[
                'سُبْحَانَ اللَّهِ',
                'الْحَمْدُ لِلَّهِ',
                'لا إِلَهَ إِلا اللَّهُ',
                'اللَّهُ أَكْبَرُ',
                'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ',
                'أَسْتَغْفِرُ اللَّهَ وَأَتُوبُ إِلَيْهِ'
              ].map((String value) => DropdownMenuItem<String>(value: value, child: Text(value))).toList(),
              onChanged: (newValue) => setState(() {
                _currentZikr = newValue!;
                _counter = 0;
              }),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => setState(() => _counter++),
              child: CircleAvatar(
                radius: 90,
                backgroundColor: Colors.blue.shade100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$_counter', style: const TextStyle(fontSize: 52, fontWeight: FontWeight.bold, color: Colors.blue)),
                    const Text('اضغط للتسبيح', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => setState(() => _counter = 0),
              icon: const Icon(Icons.refresh),
              label: const Text('تصفير العدّاد'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade400, foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
