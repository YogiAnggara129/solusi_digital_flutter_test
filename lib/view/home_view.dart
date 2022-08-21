import 'package:flutter/material.dart';
import 'package:solusi_digital_flutter_test/model/news.dart';
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
            return const CircularProgressIndicator();
          }

          news = newsViewModel.newsList;

          return Scaffold(
              appBar: homeBar(),
              body: SingleChildScrollView(
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
              ));
        });
  }

  homeBar() {
    return AppBar(
      toolbarHeight: 130,
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
                const Text('Hi, Bagus'),
                const SizedBox(
                  width: 17.0,
                ),
                Image.asset('icons/user.png'),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xffF4F4F4),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(width: 1, color: Color(0xffE3E3E3))),
                hintText: 'Cari Klinik / Rumah Sakit',
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
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: const LinearGradient(
              colors: [const Color(0xff0093DD), const Color(0xffDD127B)],
              stops: [0, 1])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('INFO ANTRIAN'),
          const Divider(
            color: Colors.white,
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow),
                        shape: BoxShape.circle),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('21'),
                    ),
                  ),
                  const Text('Nomor Antrian')
                ],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow),
                        shape: BoxShape.circle),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('5'),
                    ),
                  ),
                  const Text('Sisa Antrian')
                ],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                children: const [
                  Text('Dokter Anda'),
                  Text('Dokter Anda'),
                  Text('Dokter Anda'),
                  Text('Dokter Anda'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  menu() {
    return Column(children: [
      const SizedBox(
        height: 25.0,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          children: [
            Image.asset('icons/hospital.png'),
            const Text('Klinik Terdekat')
          ],
        ),
        Column(
          children: [
            Image.asset('icons/hospital.png'),
            const Text('Klinik Terdekat')
          ],
        ),
        Column(
          children: [
            Image.asset('icons/hospital.png'),
            const Text('Klinik Terdekat')
          ],
        ),
      ]),
      const SizedBox(
        height: 20,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          children: [
            Image.asset('icons/hospital.png'),
            const Text('Klinik Terdekat')
          ],
        ),
        Column(
          children: [
            Image.asset('icons/hospital.png'),
            const Text('Klinik Terdekat')
          ],
        ),
        Column(
          children: [
            Image.asset('icons/hospital.png'),
            const Text('Klinik Terdekat')
          ],
        ),
      ]),
      const SizedBox(
        height: 25.0,
      ),
    ]);
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
              return InkWell(
                onTap: () {},
                child: Card(
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
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          item.author == null ? 'Anonim' : item.author!,
                          style: const TextStyle(fontSize: 10.0, color: Colors.grey),
                        ),
                        Text(
                          item.publishedAt!,
                          style: const TextStyle(fontSize: 10.0, color: Colors.grey),
                        ),
                        Text(item.description!, style: const TextStyle(fontSize: 10.0),
                        ),
                        const SizedBox(
                          height: 20.0,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
