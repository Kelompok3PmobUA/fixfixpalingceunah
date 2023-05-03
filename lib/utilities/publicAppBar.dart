import 'package:flutter/material.dart';

class PublicAppBar extends StatelessWidget {
  const PublicAppBar({super.key});

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
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
