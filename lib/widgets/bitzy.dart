import 'package:flutter/material.dart';
import 'package:odinlab/constant/colors.dart';

class Bitzy extends StatefulWidget {
  const Bitzy({super.key});

  @override
  BitzyState createState() => BitzyState();
}

class BitzyState extends State<Bitzy> {
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String text) {
    if (text.isEmpty) return;

    setState(
      () {
        // add user message
        _messages.add({"text": text, "isUser": true});

        // simulated bot response
        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            setState(() {
              _messages.add({
                "text": "Hello! I'm Bitzy,\nHow can I assist you ?",
                "isUser": false,
              });
            });
          },
        );
      },
    );

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // chat Header
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kMainColor,
                kSubMainColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: kShadowColor,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 10,
                  right: 20,
                  left: 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/gifs/onboarding_3.gif",
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: Text(
                        "Hi.. I'm Bitzy!\nHow can I help You ?",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // close button
              Positioned(
                top: 25,
                right: 10,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                    color: kWhiteColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),

        // chat messages
        Expanded(
          child: ListView.builder(
            reverse: true,
            padding: const EdgeInsets.all(10),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final message = _messages[_messages.length - 1 - index];
              return Align(
                alignment: message['isUser']
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(12),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: message["isUser"]
                          ? [kMainColor, kSubMainColor]
                          : [kWhiteColor, kWhiteColor],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                      bottomLeft: message['isUser']
                          ? const Radius.circular(20)
                          : const Radius.circular(0),
                      bottomRight: message['isUser']
                          ? const Radius.circular(0)
                          : const Radius.circular(20),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: kShadowColor,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    message['text'],
                    style: TextStyle(
                      color: message['isUser'] ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // input field
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: kShadowColor,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ]),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  textInputAction: TextInputAction.send,
                  onSubmitted: _sendMessage,
                  decoration: InputDecoration(
                    hintText: "Message Bitzy...",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 25,
                backgroundColor: kSubMainColor,
                child: IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}