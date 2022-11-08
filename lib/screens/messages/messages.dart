import 'dart:convert';

import 'dart:math';
import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';

import 'package:path_provider/path_provider.dart';
import 'package:punditv/screens/messages/components/hasil.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;

class MessagesScreen extends StatefulWidget {
  String email;
  MessagesScreen({super.key, required this.email});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState(email: email);
}

class _MessagesScreenState extends State<MessagesScreen> {
  late String email;
  _MessagesScreenState({required this.email});
  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();

  //end
  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(
        0,
        message,
      );
    });
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
        imageQuality: 70, maxWidth: 1440, source: ImageSource.camera);

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);
      final message = types.ImageMessage(
          author: _user,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch,
          height: image.height.toDouble(),
          id: randomString(),
          name: result.name,
          size: bytes.length,
          uri: result.path,
          width: image.width.toDouble());
      _addMessage(message);
    }
  }

  void _handleSelectionFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
          author: _user,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch,
          id: randomString(),
          uri: result.files.single.path!,
          name: result.files.single.name,
          size: result.files.single.size);
      _addMessage(message);
    }
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      updatedAt: DateTime.now().millisecondsSinceEpoch,
      author: _user,
      previewData: message.previewData,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      backgroundColor: kblue,
      barrierColor: kblue.withOpacity(0.2),
      elevation: 0,
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kblue,
                  kpurple,
                ]),
            color: kpurple,
          ),
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: InkWell(
                  onTap: _handleImageSelection,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: kwhite,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Photo',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: InkWell(
                  onTap: _handleSelectionFile,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.file_upload,
                        color: kwhite,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'File',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handlePreviewDataFetched(
      types.TextMessage message, types.PreviewData previewData) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  // void _handleMessageTap(BuildContext _, types.Message message) async {
  //   if (message is types.FileMessage) {
  //     var localPath = message.uri;

  //     if (message.uri.startsWith('http')) {
  //       try {
  //         final index =
  //             _messages.indexWhere((element) => element.id == message.id);
  //         final updatedMessage =
  //             (_messages[index] as types.FileMessage).copyWith(
  //           isLoading: true,
  //         );

  //         setState(() {
  //           _messages[index] = updatedMessage;
  //         });

  //         final client = http.Client();
  //         final request = await client.get(Uri.parse(message.uri));
  //         final bytes = request.bodyBytes;
  //         final documentsDir = (await getApplicationDocumentsDirectory()).path;
  //         localPath = '$documentsDir/${message.name}';

  //         if (!File(localPath).existsSync()) {
  //           final file = File(localPath);
  //           await file.writeAsBytes(bytes);
  //         }
  //       } finally {
  //         final index =
  //             _messages.indexWhere((element) => element.id == message.id);
  //         final updatedMessage =
  //             (_messages[index] as types.FileMessage).copyWith(
  //           isLoading: null,
  //         );

  //         setState(() {
  //           _messages[index] = updatedMessage;
  //         });
  //       }
  //     }

  //     await OpenFile.open(localPath);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kpurple,
        appBar: AppBar(
          backgroundColor: kpurple,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new)),
          title: Text(
            'Admin Pundi TV',
            style: TextStyle(color: kwhite, fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: kpurple),
                child: messages(
                  email: email,
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                        color: kpurple,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [kblue, kpurple])),
                    child: TextFormField(
                      controller: message,
                      onSaved: (value) {
                        message.text = value!;
                      },
                      style: TextStyle(color: kwhite, fontSize: 12),
                      decoration: InputDecoration(
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: 'Send Pundi TV',
                          hintStyle: TextStyle(color: kwhite, fontSize: 12),
                          prefixIcon: IconButton(
                              onPressed: () => _handleAttachmentPressed(),
                              icon: ImageIcon(
                                  AssetImage('assets/icons/open_folder.png'))),
                          suffixIcon: IconButton(
                              onPressed: () {
                                if (message.text.isNotEmpty) {
                                  fs.collection('Messages').doc().set({
                                    'message': message.text.trim(),
                                    'time': DateTime.now(),
                                    'email': email,
                                  });

                                  message.clear();
                                }
                              },
                              icon: ImageIcon(
                                  AssetImage('assets/icons/send.png')))),
                    ),
                  )),
                ],
              )
            ],
          ),
        ));
  }
}
// Chat(
//         l10n: const ChatL10nEn(
//           inputPlaceholder: 'PundiTv',
//         ),
//         theme: const DefaultChatTheme(
//             inputTextCursorColor: kwhite,
//             backgroundColor: kpurple,
//             inputBackgroundColor: kblue,
//             inputTextColor: kwhite,
//             inputContainerDecoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(18), topRight: Radius.circular(18)),
//               gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     kblue,
//                     kpurple,
//                   ]),
//             )),
//         messages: _messages,
//         onAttachmentPressed: _handleAttachmentPressed,
//         onSendPressed: _handleSendPressed,
//         onPreviewDataFetched: _handlePreviewDataFetched,
//         user: _user,
//         // onMessageTap: _handleMessageTap,
//         showUserAvatars: true,
//         showUserNames: true,
//       ),
