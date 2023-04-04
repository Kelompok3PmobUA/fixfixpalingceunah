import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF2585DE),
                  Color(0xFFA4D3FF),
                ]),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          // Profila Name
                          Text(
                            "Halo Wahyu",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Nunito',
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Saat ini kamu punya x tugas",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Nunito',
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),

                      // Profile Pict
                      Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.person_rounded,
                          )),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                            child: Column(
                          children: const [
                            SizedBox(height: 10),
                            Text(
                              '"Sepertinya aku tidak melakukan apa-apa, tetapi di kepalaku, aku cukup sibuk."',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  color: Color(0xFF2585DE)),
                            ),
                            Text(
                              '- someone',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  color: Color(0xFF2585DE)),
                            ),
                            SizedBox(height: 10)
                          ],
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Slidable(
//  endActionPane: ActionPane(motion: StretchMotion(), children: [
//                 SlidableAction(
//                   onPressed: deleteTask,
//                   icon: Icons.delete_forever_rounded,
//                   foregroundColor: Colors.black,
//                   autoClose: true,
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(15),
//                       bottomRight: Radius.circular(15)),
//                   backgroundColor: Colors.red,
//                 ),
//               ]),
// )