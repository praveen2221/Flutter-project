class Category {
  Category({
    required this.categoryId,
    required this.categoryName,
    required this.categoryStatus,
  });

  String categoryId;
  String categoryName;
  String categoryStatus;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        categoryStatus: json["categoryStatus"],
      );
}
