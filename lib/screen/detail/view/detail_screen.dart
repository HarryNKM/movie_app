import 'package:flutter/material.dart';
import 'package:movie_app/screen/home/model/home_model.dart';
import 'package:movie_app/screen/home/view/home_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    HomeModal modal = ModalRoute.of(context)!.settings.arguments as HomeModal;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            padding:
                const EdgeInsets.only(top: 35, right: 10, left: 12, bottom: 12),
            decoration: const BoxDecoration(
              color: Color(0xff1A1A1D),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Details",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 350,
                  width: MediaQuery.sizeOf(context).width,
                  child: Image.network(
                    "${providerW!.modal!.Poster}",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${modal.Title}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      "${modal.Year}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    Text("Duration : ${modal.Runtime}",style: const TextStyle(color: Colors.white,fontSize: 18),),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${modal.Director}",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Language : ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${modal.Language}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Text("IMDB : ",style: TextStyle(color: Colors.white,fontSize: 22),),
                    Text("${modal.imdbRating}",style: const TextStyle(color: Colors.white,fontSize: 20),),
                  ],
                ),
                const SizedBox(height: 10,),
                Text("Rated : ${modal.Rated}",style: const TextStyle(color: Colors.white,fontSize: 18),),
                Text("Released : ${modal.Released}",style: const TextStyle(color: Colors.white,fontSize: 18)),
                Text("Writers : ${modal.Writer}",style: const TextStyle(color: Colors.white,fontSize: 18))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
