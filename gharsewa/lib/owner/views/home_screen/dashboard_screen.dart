import 'package:flutter/material.dart';
import 'package:gharsewa/owner/views/property_screen/property_details.dart';
import 'package:gharsewa/owner/views/widgets/appbar_widget.dart';
import 'package:gharsewa/owner/views/widgets/dashboard_button.dart';
import 'package:gharsewa/owner/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarWidget("Dashboard"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    dashboardButton(
                      context,
                      title: "Total Properties",
                      count: "2",
                      icon: "assets/icons/Tproperty.png",
                    ),
                    dashboardButton(
                      context,
                      title: "Rating",
                      count: "4.6/5.0",
                      icon: "assets/icons/rating.png",
                    ),
                  ],
                ),
                10.heightBox,
                const Divider(),
                10.heightBox,
                boldText(
                    text: "Popular Property",
                    color: const Color.fromRGBO(73, 73, 73, 1),
                    size: 16.0),
                20.heightBox,
                ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                    2,
                    (index) => Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PropertyDetails(),
                            ),
                          );
                        },
                        leading: Image.asset(
                          "assets/images/room4.jpg",
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        title: boldText(
                          text: "Single Room for student",
                          color: const Color.fromRGBO(73, 73, 73, 1),
                        ),
                        subtitle: normalText(
                          text: "Rs.3000/month",
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
