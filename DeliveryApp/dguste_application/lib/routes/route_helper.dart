import 'package:get/get.dart';

import '../screens/menu/main_menu_screen.dart';
import '../screens/product_customize_details/pizza_customize_details_screen.dart';

class RouteHelper {
  static const String initial = "/";
  static const String pizzaCustomizeDetails = "/pizza-cusomize-details";

  static String getInitial() => initial;
  static String getPizzaCustomizeDetails(int pageId) =>
      "$pizzaCustomizeDetails?pageId=$pageId";

  static List<GetPage> routes = [
    //Simple GetPage
    GetPage(
      name: initial,
      page: () => const MainMenu(),
    ),
    GetPage(
      name: pizzaCustomizeDetails,
      page: () {
        var pageId = Get.parameters["pageId"];
        return PizzaCustomizeDetails(pageId: int.parse(pageId!));
      },
    )
  ];
}
