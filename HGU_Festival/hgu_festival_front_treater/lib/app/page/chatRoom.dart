import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/app/page/appBar.dart';
import 'package:hgu_sw_festival/app/page/chat.dart';
import 'package:hgu_sw_festival/chatPostApi.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class StreamSocket {
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}

StreamSocket streamSocket = StreamSocket();

// void connectAndListen() {
//   IO.Socket socket = IO.io(
//       'http://raspinas.iptime.org:64000/api/v1/socket_IO/sockets',
//       IO.OptionBuilder().setTransports(['websocket']).build());

//   socket.onConnect((_) {
//     print('connect');
//     socket.emit('msg', 'test');
//   });

//   //When an event recieved from server, data is added to the stream
//   socket.on('event', (data) => streamSocket.addResponse);
//   socket.onDisconnect((_) => print('disconnect'));
// }

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    // chatPostApi();
    print('before connectand listen');
    // connectAndListen();
    print('after connectand listen');
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: 393,
          height: 852,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 248, 255, 234),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              appBar(context),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 170,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.chat_bubble_outline),
                  ),
                  IconButton(
                    onPressed: () {
                      print('object');
                    },
                    icon: const Icon(Icons.exit_to_app_outlined),
                  ),
                ],
              ),
              Container(
                width: 360,
                height: 1,
                color: const Color.fromARGB(255, 231, 224, 236),
              ),
              SizedBox(
                width: 299,
                height: 300,
                child: StreamBuilder(
                  stream: streamSocket.getResponse,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return SizedBox(
                      width: 299,
                      height: 200,
                      child: Text('${snapshot.data}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
