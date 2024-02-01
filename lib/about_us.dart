import 'package:flutter/material.dart';
import 'package:kolaka/theme.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

void main() {
  runApp(MaterialApp(
    home: AboutUs(),
  ));
}

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final List<String> galleryImageUrls = [
    'https://diskominfo.kolakakab.go.id/assets/images/96c76718f579941998fe4644adcbe70a.jpg',
    'https://triaspolitika.id/wp-content/uploads/2022/04/Tempat-Wisata-Kolaka.jpg',
    'https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2019/01/wisata-kolaka-9-Otoritas-Newas.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: red1,
        title: Text(
          'Kabupaten Kolaka',
          style: bold16.copyWith(color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gambar cover
            Image.network(
              'https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2019/01/wisata-kolaka-9-Otoritas-Newas.jpg', // Ganti dengan URL gambar cover Anda
              fit: BoxFit.cover,
              height: 300.0, // Sesuaikan tinggi gambar cover
            ),

            // Deskripsi atau konten "Tentang Kami" Bagian Pertama
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sejarah kabupaten Kolaka',
                style: bold16.copyWith(color: dark1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Kabupaten Kolaka yang wilayahnya meliputi daratan Pulau Flores bagian barat dan beberapa pulau kecil di sekitarnya, adalah suatu kabupaten di Provinsi Nusa Tenggara Timur, Indonesia.\n\nPulau-pulau kecil yang termasuk di dalam kabupaten ini adalah pulau Komodo, pulau Rinca, pulau Seraya Besar, pulau Seraya Kecil, pulau Bidadari dan pulau Longos.\n\nLuas wilayah dari kabupaten Kolaka kurang lebih adalah 9.450 km2 yang terdiri dari wilayah daratan seluas 2.947,50 km2 dan wilayah lautan seluas 7.052,97 km2. \n\nKabupaten Kolaka merupakan hasil pemekaran dari kabupaten Manggarai, di mana ide pemekaran wilayah ini sudah ada sejak tahun 1950-an.\n\nIde pemekaran ini dicetuskan pertama kali oleh Bapak Lambertus Kape, seorang tokoh Manggarai yang pernah duduk sebagai anggota Konstituante. \n\nKeinginan untuk memekarkan kabupaten Manggarai dengan membentuk kabupaten Kolaka mulai diperjuangkan secara formal pada tahun 1963, dan melalui sidang paripurna DPR RI tanggal 27 Januari 2003 disahkanlah secara resmi Undang-undang no. 8 tahun 2003 tentang pembentukan kabupaten Kolaka.\n',
                style: regular14.copyWith(color: dark2),
              ),
            ),

            // Spasi antara dua bagian
            SizedBox(height: 20.0),

            // Deskripsi atau konten "Tentang Kami" Bagian Kedua
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Tempat wisata favorit yang wajib dikunjungi',
                style: bold16.copyWith(color: dark1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Kabupaten Kolaka yang terletak di bagian Timur Indonesia, tepatnya di Nusa Tenggara Timur, menyimpan pesona alam yang sangat fantastis. \nTidak heran jika wilayah ini menjadi salah satu destinasi paling favorit yang banyak dikunjungi oleh wisatawan domestik maupun mancanegara.\nTempat-tempat wisata favorit yang wajib dikunjungi di wilayah ini',
                style: regular14.copyWith(
                  color: dark2,
                ),
              ),
            ),

            SizedBox(height: 20.0),

            Center(
              child: Text(
                'Gallery',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 20.0),

            Container(
              height: 250.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: galleryImageUrls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenImageGallery(
                            imageUrls: galleryImageUrls,
                            initialIndex: index,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'image-$index',
                      child: Container(
                        width: 150.0,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(galleryImageUrls[index]),
                            fit: BoxFit.cover,
                          ),
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
    );
  }
}

class FullScreenImageGallery extends StatelessWidget {
  final List<String> imageUrls;
  final int initialIndex;

  FullScreenImageGallery({required this.imageUrls, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoViewGallery.builder(
        itemCount: imageUrls.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(imageUrls[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
            heroAttributes: PhotoViewHeroAttributes(tag: 'image-$index'),
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: Colors.black,
        ),
        pageController: PageController(initialPage: initialIndex),
      ),
    );
  }
}
