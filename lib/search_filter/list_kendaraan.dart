import 'package:flutter/material.dart';
import 'package:kelotimaja/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListKendaraan(),
    );
  }
}

class ListKendaraan extends StatefulWidget {
  @override
  _ListKendaraanState createState() => _ListKendaraanState();
}

class _ListKendaraanState extends State<ListKendaraan> {
  bool switchListTileValue = true; // Local variable for switch value

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red, // Use your red1 color here
          title: Text(
            'List Kendaraan',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Card(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(21),
                          child: Image.network(
                            'https://awsimages.detik.net.id/visual/2022/01/21/toyota-all-new-avanza-2015-tangkapan-layar_169.jpeg?w=650',
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New Toyota Avanza",
                              style: bold16.copyWith(color: dark1),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            Text(
                              "4.8",
                              style: regular10.copyWith(color: dark2),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "(456 Review)",
                              style: regular10.copyWith(color: dark2),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Rp. 167.210',
                            style: semibold14.copyWith(color: red1),
                            children: [
                              TextSpan(
                                text: '/hari',
                                style: semibold12_5.copyWith(color: dark2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(21),
                          child: Image.network(
                            'https://awsimages.detik.net.id/visual/2022/01/21/toyota-all-new-avanza-2015-tangkapan-layar_169.jpeg?w=650',
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New Toyota Avanza",
                              style: bold16.copyWith(color: dark1),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            Text(
                              "4.8",
                              style: regular10.copyWith(color: dark2),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "(456 Review)",
                              style: regular10.copyWith(color: dark2),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Rp. 167.210',
                            style: semibold14.copyWith(color: red1),
                            children: [
                              TextSpan(
                                text: '/hari',
                                style: semibold12_5.copyWith(color: dark2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(21),
                          child: Image.network(
                            'https://awsimages.detik.net.id/visual/2022/01/21/toyota-all-new-avanza-2015-tangkapan-layar_169.jpeg?w=650',
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New Toyota Avanza",
                              style: bold16.copyWith(color: dark1),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            Text(
                              "4.8",
                              style: regular10.copyWith(color: dark2),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "(456 Review)",
                              style: regular10.copyWith(color: dark2),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Rp. 167.210',
                            style: semibold14.copyWith(color: red1),
                            children: [
                              TextSpan(
                                text: '/hari',
                                style: semibold12_5.copyWith(color: dark2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
