class Business {
  Business({
    required this.businessId,
    required this.businessCode,
    required this.businessLogo,
    required this.businessName,
    required this.businessStatus,
    required this.businessPlanId,
    required this.planCurrentImageCount,
    required this.planAllowedImageCount,
    required this.planSubscriptionStatus,
    required this.adsName,
    required this.adsDescription,
    required this.adsImageUrl,
    required this.adsRedirectionUrl,
    required this.adsTiming,
  });

  String businessId;
  String businessCode;
  String businessLogo;
  String businessName;
  String businessStatus;
  String businessPlanId;
  String planCurrentImageCount;
  String planAllowedImageCount;
  String planSubscriptionStatus;
  String adsName;
  String adsDescription;
  String adsImageUrl;
  String adsRedirectionUrl;
  String adsTiming;

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        businessId: json["businessId"],
        businessCode: json["businessCode"],
        businessLogo: json["businessLogo"],
        businessName: json["businessName"],
        businessStatus: json["businessStatus"],
        businessPlanId: json["businessPlanId"],
        planCurrentImageCount: json["planCurrentImageCount"],
        planAllowedImageCount: json["planAllowedImageCount"],
        planSubscriptionStatus: json["planSubscriptionStatus"],
        adsName: json["adsName"],
        adsDescription: json["adsDescription"],
        adsImageUrl: json["adsImageUrl"],
        adsRedirectionUrl: json["adsRedirectionUrl"],
        adsTiming: json["adsTiming"],
      );

  Map<String, dynamic> toJson() => {
        "businessId": businessId,
        "businessCode": businessCode,
        "businessLogo": businessLogo,
        "businessName": businessName,
        "businessStatus": businessStatus,
        "businessPlanId": businessPlanId,
        "planCurrentImageCount": planCurrentImageCount,
        "planAllowedImageCount": planAllowedImageCount,
        "planSubscriptionStatus": planSubscriptionStatus,
        "adsName": adsName,
        "adsDescription": adsDescription,
        "adsImageUrl": adsImageUrl,
        "adsRedirectionUrl": adsRedirectionUrl,
        "adsTiming": adsTiming,
      };
}
