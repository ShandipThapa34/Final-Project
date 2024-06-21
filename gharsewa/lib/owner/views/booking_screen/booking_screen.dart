import 'package:flutter/material.dart';
import 'package:gharsewa/owner/views/booking_screen/booking_details_screen.dart';
import 'package:gharsewa/owner/views/widgets/appbar_widget.dart';
import 'package:gharsewa/owner/views/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;
import 'package:velocity_x/velocity_x.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbarWidget("Bookings"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              2,
              (index) {
                var time = DateTime.now();

                return Card(
                  child: Badge(
                    label: const Text("New"),
                    offset: const Offset(-12, 0),
                    isLabelVisible: true,
                    smallSize: 12,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookingDetails(),
                          ),
                        );
                      },
                      tileColor: const Color.fromRGBO(239, 239, 239, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: boldText(
                        text: "23452345234",
                        color: Colors.blue,
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_month),
                              10.widthBox,
                              normalText(
                                  text:
                                      intl.DateFormat().add_yMd().format(time),
                                  color:
                                      const Color.fromRGBO(112, 112, 112, 1)),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.approval),
                              10.widthBox,
                              normalText(
                                text: "Pending",
                                color: const Color.fromRGBO(112, 112, 112, 1),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: boldText(
                        text: "Rs 3000/month",
                        color: Colors.red,
                        size: 16.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
