import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solusi_digital_flutter_test/model/news.dart';
import 'package:solusi_digital_flutter_test/theme.dart';
import 'package:solusi_digital_flutter_test/view/news_detail_view.dart';
import 'package:solusi_digital_flutter_test/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<News> news = [];
    NewsViewModel newsViewModel = context.watch<NewsViewModel>();

    return FutureBuilder<List<News>>(
        future: newsViewModel.getNews(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          news = newsViewModel.newsList;

          return Scaffold(
              appBar: homeBar(),
              body: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Column(
                      children: [
                        antri(),
                        menu(),
                        newsList(news),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  homeBar() {
    return AppBar(
      toolbarHeight: 120,
      elevation: 0,
      flexibleSpace: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(17.0),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Hi, Bagus',
                  style: GoogleFonts.rubik(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 17.0,
                ),
                Image.asset('icons/user.png'),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 40.0,
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                    filled: true,
                    fillColor: thirdColor,
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xffE3E3E3))),
                    hintText: 'Cari Klinik / Rumah Sakit',
                    hintStyle: GoogleFonts.rubik(
                      color: secondayColor,
                      fontSize: 12.0,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  antri() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: const LinearGradient(
              colors: [Color(0xff0093DD), Color(0xffDD127B)],
              stops: [0, 1])),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 23,
          vertical: 13,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'INFO ANTRIAN',
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 70.16,
                      height: 70.16,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: yellowColorApp,
                            width: 3,
                          ),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            '21',
                            style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      'Nomor Antrian',
                      style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  children: [
                    Container(
                      width: 70.16,
                      height: 70.16,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: yellowColorApp,
                            width: 3,
                          ),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            '5',
                            style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      'Sisa Antrian',
                      style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dokter Anda',
                      style: GoogleFonts.rubik(
                          color: yellowColorApp,
                          fontSize: 9,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'dr. Rina Agustina',
                      style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Klinik / RS Anda',
                      style: GoogleFonts.rubik(
                          color: yellowColorApp,
                          fontSize: 9,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'RS. National Hospital',
                      style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  menuItem(name, icon) {
    return Column(
      children: [
        Image.asset(icon),
        const SizedBox(
          height: 11.2,
        ),
        Text(
          name,
          style: GoogleFonts.rubik(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  menu() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 23.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(
          height: 25.0,
        ),
        Column(
          children: [
            menuItem('Klinik Terdekat', 'icons/hospital.png'),
            const SizedBox(
              height: 21.2,
            ),
            menuItem('Notifikasi', 'icons/notif.png'),
          ],
        ),
        Column(
          children: [
            menuItem('Riwayat', 'icons/history.png'),
            const SizedBox(
              height: 21.2,
            ),
            menuItem('Beri Nilai', 'icons/rate.png'),
          ],
        ),
        Column(
          children: [
            menuItem('Data Scan', 'icons/image.png'),
            const SizedBox(
              height: 21.2,
            ),
            menuItem('Pengaturan', 'icons/setting.png'),
          ],
        ),
        const SizedBox(
          height: 25.0,
        ),
      ]),
    );
  }

  newsList(items) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              News item = items[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(item.urlToImage!)),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        item.title!,
                        style: GoogleFonts.rubik(
                            fontSize: 18, fontWeight: FontWeight.w500),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        item.author == null ? 'Anonim' : item.author!,
                        style: GoogleFonts.rubik(
                            fontSize: 10.0, color: Colors.grey),
                      ),
                      Text(
                        item.publishedAt!,
                        style: GoogleFonts.rubik(
                            fontSize: 10.0, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        item.content == null
                            ? item.description!
                            : item.content!,
                        style: GoogleFonts.rubik(fontSize: 10.0),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NewsDetailView(item: item)),
                          );
                        },
                        child: Text(
                          'Baca Selengkapnya...',
                          style: GoogleFonts.rubik(
                              color: Colors.blue[400], fontSize: 10.0),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
