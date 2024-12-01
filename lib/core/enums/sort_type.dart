enum SortEnum { PRICEDEC, PRICEINC, RATEDEC, RATEIN }

extension SortExt on SortEnum {
  static const values = {
    SortEnum.PRICEDEC: "Price: Low to High",
    SortEnum.PRICEINC: "Price: High to Low",
    SortEnum.RATEDEC: "Rate: High to Low",
    SortEnum.RATEIN: "Rate: Low to High"
  };
  String get namex {
    return values[this] ?? "";
  }
}
