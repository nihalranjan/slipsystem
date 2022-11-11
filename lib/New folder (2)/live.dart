import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:slipsystem/New folder (2)/chat.dart';

class LivePage extends StatelessWidget {
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'BDOYGO5DTxs',
      flags: YoutubePlayerFlags(
        isLive: true,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Expanded(
              child: YoutubePlayer(
                controller: _controller,
                liveUIColor: Colors.amber,
              ),
            ),
            Container(
              height: 500,
            ),
          ],
        ),
      ),
    );
  }
}
