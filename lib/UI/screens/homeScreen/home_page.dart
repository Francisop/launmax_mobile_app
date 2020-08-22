import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:launmax_app/UI/screens/order/track_order.dart';

import '../../../styles.dart';

final user = "John";

class HomePage extends StatelessWidget {
  static Widget appBar() {
    return AppBar(
      bottom: buildBottomComponent(),
      elevation: 1,
      centerTitle: false,
      title: Text(
        'Good Morning, $user!',
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Color(0xFFA7A7A7)),
      ),
    );
  }

  static buildBottomComponent() {
    return PreferredSize(
      preferredSize: Size.fromHeight(40),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(17, 0, 14, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'What do you want to do today?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.neutralBlack,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 17),
      mainAxisSpacing: 50,
      crossAxisSpacing: 28,
      crossAxisCount: 2,
      children: [
        HomePageCard(
          text: "Request Pick up",
          iconPath: 'assets/images/delivery.svg',
          onTap: () {},
        ),
        HomePageCard(
          text: "Schedule Pick up",
          iconPath: 'assets/images/calendar.svg',
          onTap: () {},
        ),
        HomePageCard(
          text: "View Pricing",
          iconPath: 'assets/images/naira.svg',
          onTap: () {},
        ),
        HomePageCard(
          text: "Track Order",
          iconPath: 'assets/images/delivery2.svg',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=> TrackOrder()));
          },
        ),
      ],
    );
  }
}

class HomePageCard extends StatelessWidget {
  final String text;
  final String iconPath;
  final Color color;
  final VoidCallback onTap;
  const HomePageCard({
    Key key,
    this.text,
    this.iconPath,
    this.color = Colors.white,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 16),
              blurRadius: 16,
              color: AppColor.offset,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(iconPath),
              Text(
                text,
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
