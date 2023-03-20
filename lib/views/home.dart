import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player2023/conrollers/player_controller.dart';
import 'package:music_player2023/consts/colors.dart';
import 'package:music_player2023/consts/textstyle.dart';
import 'package:music_player2023/views/player.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());
    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: whiteColor,
              ))
        ],
        leading: const Icon(
          Icons.sort_rounded,
          color: whiteColor,
        ),
        title: Center(
          child: Text("JILLY",
              style: ourStyle(
                fontFamily: "Bold",
                color: whiteColor,
                fontsize: 20,
              )),
        ),
      ),
      body: FutureBuilder<List<SongModel>>(
          future: controller.audioquery.querySongs(
              ignoreCase: true,
              orderType: OrderType.ASC_OR_SMALLER,
              sortType: null,
              uriType: UriType.EXTERNAL),
          builder: (BuildContext context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  "no songs found",
                  style: ourStyle(),
                ),
              );
            } else {
              print(snapshot);
              return Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                            //clipBehavior: Clip.antiAlias,
                            margin: const EdgeInsets.only(bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: Obx(
                              () => ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                tileColor: bgColor,
                                title: Text(
                                  snapshot.data![index].displayNameWOExt,
                                  style: ourStyle(
                                      fontFamily: "bold", fontsize: 15),
                                ),
                                subtitle: Text(
                                  snapshot.data![index].artist.toString(),
                                  style: ourStyle(
                                      fontFamily: "bold", fontsize: 12),
                                ),
                                leading: QueryArtworkWidget(
                                  id: snapshot.data![index].id,
                                  type: ArtworkType.AUDIO,
                                  nullArtworkWidget: const Icon(
                                    Icons.music_note,
                                    color: whiteColor,
                                    size: 32,
                                  ),
                                ),
                                trailing: controller.playIndex.value == index &&
                                        controller.isPlaying.value
                                    ? const Icon(
                                        Icons.play_arrow,
                                        color: whiteColor,
                                        size: 30,
                                      )
                                    : null,
                                onTap: () {
                                  Get.to(() => Player(
                                        data: snapshot.data!,
                                      ));
                                  controller.playSong(
                                      snapshot.data![index].uri, index);
                                },
                              ),
                            ));
                      }));
            }
          }),
    );
  }
}
