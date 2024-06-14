import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/screen/home/model/home_model.dart';
import 'package:movie_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

HomeProvider? providerR;
HomeProvider? providerW;
SearchController controller = SearchController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getMoviedata();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: providerW!.modal,
          builder: (context, snapshot) {
            HomeModal? modal = snapshot.data;
            if (snapshot.hasError) {
              const Text("Data not found");
            } else if (snapshot.hasData) {
              return Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.only(
                    top: 35, right: 12, left: 12, bottom: 12),
                decoration: const BoxDecoration(
                  color: Color(0xff1A1A1D),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Search for a content",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SearchBar(
                      controller: controller,
                      hintText: "search here",
                      trailing: [
                        IconButton(
                            onPressed: () {
                              providerR!.searchData(controller.text);
                            },
                            icon: const Icon(Icons.search_outlined))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemCount: modal!.search!.length,
                        itemBuilder: (context, index) {
                            return  InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, 'detail',arguments: modal);
                              },
                              child: GridTile(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 20,
                                  width: 20,
                                  child: Image.network("${modal.search![index].poster}",fit: BoxFit.cover,),
                                ),
                              ),
                            );
                        },
                      ),
                    )
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
