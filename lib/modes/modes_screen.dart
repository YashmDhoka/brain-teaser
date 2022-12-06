// ignore_for_file: camel_case_types, file_names

// import 'package:brain_power/modes/difficultmode.dart';
import 'package:brain_teaser/modes/easy_mode.dart';
import 'package:brain_teaser/modes/medium_mode.dart';
import 'package:flutter/material.dart';

class modes extends StatelessWidget {
  const modes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffA6A6A4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Modes',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, colors: <Color>[
            Color(0xff395B64),
            Color(0xff40B5AD),
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Flexible(
                  child: Center(
                    child: SizedBox(
                      height: 50,
                      width: 190,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const easymode()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffA5C9CA),
                        ),
                        child: const Text(
                          'Easy',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Flexible(
                  child: Center(
                    child: SizedBox(
                      height: 50,
                      width: 190,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const mediummode()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffA5C9CA),
                        ),
                        child: const Text(
                          'Medium',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            // Row(
            //   children: [
            //     Flexible(
            //       child: Center(
            //         child: SizedBox(
            //           height: 50,
            //           width: 190,
            //           child: ElevatedButton(
            //             onPressed: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => const difficultmode()),
            //               );
            //             },
            //             child: const Text(
            //               'Difficult',
            //               style: TextStyle(
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 30,
            //               ),
            //             ),
            //             style: ElevatedButton.styleFrom(
            //                 primary: const Color(0xffA6A6A4)),
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
