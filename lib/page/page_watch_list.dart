import 'package:counter_7/page/detail_watch_list.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/function/fetch_watch_list.dart';

class PageWatchList extends StatefulWidget {
  const PageWatchList({Key? key}) : super(key: key);

  @override
  _PageWatchListState createState() => _PageWatchListState();
}


class _PageWatchListState extends State<PageWatchList> {
  @override
  Widget build(Object context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            'My Watch List',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
        drawer: DrawerClass("My Watch List"),
        body: FutureBuilder(
            future: fetchMyWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada watch list",
                        style:
                        TextStyle(color: Color.fromRGBO(0,102,102,1), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0,102,102,1),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WatchListDetailPage(
                                  title:
                                  futureWatchList[index].fields.title,
                                  watched:
                                  futureWatchList[index].fields.watched,
                                  rating:
                                  futureWatchList[index].fields.rating,
                                  releasedDate: futureWatchList[index]
                                      .fields
                                      .releaseDate
                                      .toString(),
                                  review:
                                  futureWatchList[index].fields.review,
                                ))),
                        child: Row(
                          children: [
                            Text(
                              "${snapshot.data![index].fields.title}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 100.0,
                            ),
                            Checkbox(
                                checkColor: Colors.white,
                                activeColor: const Color.fromRGBO(0,102,102,1),
                                value: futureWatchList[index].fields.watched,
                                onChanged: (bool? value) {
                                  setState(() {
                                    futureWatchList[index].fields.watched =
                                    value!;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
            }));
  }
}