import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solusi_digital_flutter_test/model/news.dart';

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({Key? key, required this.item}) : super(key: key);

  final News item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Berita')),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
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
              style:
                  GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              item.author == null ? 'Anonim' : item.author!,
              style: GoogleFonts.rubik(fontSize: 10.0, color: Colors.grey),
            ),
            Text(
              item.publishedAt!,
              style: GoogleFonts.rubik(fontSize: 10.0, color: Colors.grey),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              item.content == null ? item.description! : item.content!,
              style: GoogleFonts.rubik(fontSize: 10.0),
            ),
          ],
        ),
      ),
    );
  }
}
