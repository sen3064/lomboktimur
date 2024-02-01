import 'package:flutter/material.dart';
import 'package:kelotimaja/search_filter/list_kendaraan.dart';
import 'package:kelotimaja/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CariKendaraan(),
    );
  }
}

class CariKendaraan extends StatefulWidget {
  @override
  _CariKendaraanState createState() => _CariKendaraanState();
}

class _CariKendaraanState extends State<CariKendaraan> {
  bool switchListTileValue = true; // Local variable for switch value

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: red1,
          title: Text(
            'Cari Kendaraan Favorit Anda',
            style: bold16.copyWith(color: white),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Mobil'),
              Tab(text: 'Motor'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Isi dari Tab 1
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: white,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SwitchListTile.adaptive(
                          value: switchListTileValue,
                          onChanged: (newValue) {
                            setState(() {
                              switchListTileValue = newValue;
                            });
                          },
                          title: Text(
                            'Cari Dengan Supir',
                            style: bold16.copyWith(color: dark1),
                          ),
                          subtitle: Text(
                            'Tidak punya supir cari dengan supir',
                            style: regular16.copyWith(color: dark2),
                          ),
                          tileColor: red1,
                          activeColor: red1,
                          activeTrackColor: dark3,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                        Divider(
                            thickness: 1, color: Color.fromARGB(45, 0, 0, 0)),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lokasi Penjemputan',
                                style: bold16.copyWith(color: dark1),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: dark2,
                                    size: 20,
                                  ),
                                  Text(
                                    "Pilih Lokasi",
                                    style: semibold14.copyWith(color: dark2),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 5, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ListKendaraan(), // Correct class instantiation
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: red1,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          "Cari Kendaraan",
                                          style: bold16.copyWith(color: white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Isi dari Tab 2
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: white,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lokasi Penjemputan',
                                  style: bold16.copyWith(color: dark1),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: dark2,
                                      size: 20,
                                    ),
                                    Text(
                                      "Pilih Lokasi",
                                      style: semibold14.copyWith(color: dark2),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 5, 0),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: red1,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          "Cari Kendaraan",
                                          style: bold16.copyWith(color: white),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
