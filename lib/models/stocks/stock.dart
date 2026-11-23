class Stock {
  final int count;
  final String name, type;
  final num value, variation, variationPercent;

  static Stock emptyStock = Stock('', 0, 0, 0, 0, '');

  Stock(this.name, this.value, this.count, this.variation,
      this.variationPercent, this.type);
}
