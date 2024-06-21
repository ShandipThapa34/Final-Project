import 'package:get/get.dart';

class BookingController extends GetxController {
  var confirmed = false.obs;
  var cancelled = false.obs;

  changeStatus({title, status}) async {
    if (title == "cancelled") {
      cancelled = status;
    } else {
      confirmed = status;
    }
  }
}
