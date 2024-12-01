enum BottomTapsEnum { HOME, SETTINGS, ORDER }

extension BottomTabsExt on BottomTapsEnum {
  static const values = {
    BottomTapsEnum.HOME: "Home",
    BottomTapsEnum.SETTINGS: "Settings",
    BottomTapsEnum.ORDER: "Order",
  };
}
