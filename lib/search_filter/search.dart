import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelotimaja/makanan/detail_resto/detail_resto_widget.dart';
import 'package:kelotimaja/penginapan/detail_penginapan/detail_penginapan_widget.dart';
import 'package:kelotimaja/penginapan/list_penginapan/list_penginapan_widget.dart';
import 'package:kelotimaja/transportasi/detail_transpotasi_mobil/detail_transpotasi_mobil_widget.dart';
import 'dart:convert';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:http/http.dart' as http;
import 'package:kelotimaja/flutter_flow/flutter_flow_util.dart';
import 'package:kelotimaja/theme.dart';
import 'package:kelotimaja/tiket_wisata/beli_tiket_wisata/beli_tiket_wisata_widget.dart';
import 'package:kelotimaja/umkm/detail_produk_food/detail_produk_food_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  late Future<List<SearchResult>?> _searchFuture;

  @override
  void initState() {
    super.initState();
    _searchFuture = Future.value([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: 100,
        title: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari...',
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                  ),
                  onChanged: (query) {
                    _performSearch(query);
                  },
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'TUTUP',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: _buildSearchResults(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onRefresh() async {
    _performSearch(_searchController.text);
  }

  Widget _buildSearchResults() {
    DateTime checkin = DateTime.now().add(Duration(days: 1));
    String formattedStartdate = DateFormat('d/M/y').format(checkin);
    DateTime checkout = DateTime.now().add(Duration(days: 2));
    String formattedEndate = DateFormat('d/M/y').format(checkout);
    DateTime now = DateTime.now();
    String formattedNow = DateFormat('yyyy-MM-dd').format(now);

    return _searchController.text.isEmpty
        ? Center(child: Text('Masukkan kata kunci pencarian'))
        : FutureBuilder<List<SearchResult>?>(
            future: _searchFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.data == null) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.data!.isEmpty) {
                return Center(child: Text('Tidak ada data ditemukan'));
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final listItem = snapshot.data![index].isData;
                      final categories = snapshot.data![index].category;
                      return InkWell(
                        onTap: () async {
                          // print(listItem);
                          if (categories == 'tiket-wisata') {
                            print('tiket wisata');
                            DateTime? startDate = FFAppState().startDate;

                            String formattedStartDate = startDate != null
                                ? DateFormat('yyyy-MM-dd').format(startDate)
                                : formattedNow;

                            Get.to(() => BeliTiketWisataWidget(
                                  dataTiket: listItem,
                                  startDate: formattedStartDate,
                                ));
                          } else if (categories == 'homestay') {
                            print('homestay');
                            // print(getJsonField(listItem, r'''$.id''',).toString());

                            if (snapshot.data![index].name != null &&
                                listItem['gallery'] != null) {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPenginapanWidget(
                                    hid: getJsonField(
                                      listItem,
                                      r'''$.id''',
                                    ).toString(),
                                    homestayData: listItem,
                                    startDate: valueOrDefault<String>(
                                      functions.formatDate(formattedStartdate),
                                      'null',
                                    ),
                                    endDate: valueOrDefault<String>(
                                      functions.formatDate(formattedEndate),
                                      'null',
                                    ),
                                    rooms: '1',
                                    guests: '2',
                                    terms: getJsonField(
                                      listItem,
                                      r'''$.terms_by_attribute_in_listing_page''',
                                    ),
                                    mapLat: double.parse(getJsonField(
                                      listItem,
                                      r'''$.map_lat''',
                                    ).toString()),
                                    mapLng: double.parse(getJsonField(
                                      listItem,
                                      r'''$.map_lng''',
                                    ).toString()),
                                    locationLatLng: functions.locationLatLng(
                                        double.parse(getJsonField(
                                          listItem,
                                          r'''$.map_lat''',
                                        ).toString()),
                                        double.parse(getJsonField(
                                          listItem,
                                          r'''$.map_lng''',
                                        ).toString()))!,
                                  ),
                                ),
                              );
                            } else {
                              Get.to(() => ListPenginapanWidget());
                            }
                          } else if (categories == 'UMKM') {
                            print('umkm');

                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailProdukFoodWidget(
                                  umkmData: listItem,
                                  umkmId: getJsonField(
                                    listItem,
                                    r'''$.id''',
                                  ).toString(),
                                  variants: getJsonField(
                                    listItem,
                                    r'''$.variants''',
                                  ),
                                ),
                              ),
                            );
                          } else if (categories == 'food-beverages') {
                            print('makanan minuman');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailRestoWidget(
                                  createUser: getJsonField(
                                      listItem, r'''$.create_user'''),
                                  dataToko: listItem['seller'],
                                ),
                              ),
                            );
                          } else if (categories == 'transportasi') {
                            print('transportsai');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailTranspotasiMobilWidget(
                                  rentData: listItem,
                                ),
                              ),
                            );
                          } else {
                            print('not found');
                          }
                        },
                        child: ListTile(
                          title: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    snapshot.data![index].imageUrl,
                                    scale: 1.0,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].name,
                                    style: semibold12_5.copyWith(color: dark2),
                                  ),
                                  Text(
                                    'Rp ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(snapshot.data![index].price))}',
                                    style: regular12_5.copyWith(color: red1),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // subtitle: Text(snapshot.data![index].description),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          );
  }

  void _performSearch(String query) {
    setState(() {
      _searchFuture = _search(query);
    });
  }

  Future<List<SearchResult>?> _search(String query) async {
    String apiUrl =
        'https://api.kelotimaja.kabtour.com/v2/keyword-search?keyword=$query';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data.containsKey('data')) {
          List<SearchResult> resultList = _parseSearchResults(data['data']);
          return resultList;
        } else {
          throw Exception('Data not found');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('An error occurred');
    }
  }

  List<SearchResult> _parseSearchResults(Map<String, dynamic> searchData) {
    List<SearchResult> results = [];

    // if (searchData.containsKey('homestay')) {
    //   results.addAll(_parseCategoryResults(searchData['homestay'], 'homestay'));
    // }

    // if (searchData.containsKey('umkm')) {
    //   results.addAll(_parseCategoryResults(searchData['umkm'], 'UMKM'));
    // }

    // if (searchData.containsKey('food-beverages')) {
    //   results.addAll(_parseCategoryResults(
    //       searchData['food-beverages'], 'food-beverages'));
    // }

    // if (searchData.containsKey('transportasi')) {
    //   results.addAll(
    //       _parseCategoryResults(searchData['transportasi'], 'transportasi'));
    // }

    if (searchData.containsKey('tiket-wisata')) {
      results.addAll(
          _parseCategoryResults(searchData['tiket-wisata'], 'tiket-wisata'));
    }

    return results;
  }

  // List<SearchResult> _parseCategoryResults(
  //     List<dynamic> categoryData, String category) {
  //       // print(categoryData.map<SearchResult>((SearchResult(isData: ))));
  //   return categoryData
  //       .map<SearchResult>((item) => SearchResult(
  //             isData: item,
  //             name: item['name'] ?? item['title'],
  //             description: item['description'] ?? '',
  //             price: item['price']?.toString() ?? '0',
  //             category: category,
  //             imageUrl: item['banner']['200x150'] ??
  //                 '', // Adjust the key based on your API
  //           ))
  //       .toList();
  // }

  List<SearchResult> _parseCategoryResults(
      List<dynamic> categoryData, String category) {
    return categoryData.map<SearchResult>((item) {
      // print('Print item: $item');
      return SearchResult.fromMap(
        isData: item,
        category: category,
        name: item['name'] ?? item['title'],
        description: item['description'] ?? '',
        price: item['price']?.toString() ?? '0',
        imageUrl: item['banner']['200x150'] ?? '',
      );
    }).toList();
  }
}

class SearchResult {
  final dynamic isData;
  final String name;
  final String description;
  final String price;
  final String category;
  final String imageUrl; // Add this line

  SearchResult({
    required this.isData,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl, // Add this line
  });
  factory SearchResult.fromMap({
    required dynamic isData,
    required String category,
    required String name,
    required String description,
    required String price,
    required String imageUrl,
  }) {
    return SearchResult(
      isData: isData,
      category: category,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );
  }

  @override
  String toString() {
    return 'SearchResult{isData: $isData, category: $category}';
  }
}
