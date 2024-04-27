import 'package:chat_application_iub_cse464/const_config/color_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.scaffoldColor,
      body: Column(
        children: [
          const Center(
            child: Text("Meet Chat Meta Users"),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("users").snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData && snapshot.connectionState == ConnectionState.active) {
                  var users = snapshot.data.docs;
                  return users.length != 0
                      ? ListView.builder(
                    itemCount: users.length,
            
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                RandomAvatar(
                                  snapshot.data.docs[index]['name'].toString(),
                                  trBackground: false,
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(width: 10,),
                                Text(snapshot.data.docs[index]['email']),
                              ],
                            )
                          ),),
                      );
                    },
                  )
                      : const Center(child: Text("No users to show"));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      )
    );
  }
}