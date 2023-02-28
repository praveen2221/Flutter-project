class APIEndpoint {
  static String get login => "/login";
  static String get register => "/register";
  static String get resetPassword => "/reset-password";
  static String get forgotPassword => "/forgot-password";

  static String get countries => "/countries";
  static String get cities => "/states";
  static String get offers => "/get-category-offers";
  static String get rating => "/ratings";

  static String get profile => "/view-profile";
  static String get updateProfile => "/update-profile";

  static String get category => "/categories";
  static String get categoryOffers => "/get-category-offers";
  static String get offerDetails => "/offer-details";
  static String get offerRatings => "/get-ratings";
  static String get requestNotification => "/offer/notification";

  static String get getFavourites => "/get-favourites";
  static String get addToFavourites => "/add-to-favourite";

  static String get getBrands => "/brands";
  static String get getBrandOffers => "/get-brand-offers";
  static String get getPremiumBrands => "/get-premium-brands";
  static String get getExclusiveOffers => "/get-exclusive-offers";

  static String get rateAndComment => "/ratings";
  static String get getHome => "/home";
  static String get searchOffers => "/search-offers";
  static String get addFamilyMember => "/add-family-member";
  static String get viewFamilyMember => "/view-family-members";
  static String get deleteFamilyMember => "/delete-family-members/";
  static String get activateFamilyMember => "/status/active/";
  static String get rejectFamilyMember => "/status/reject/";

  static String get saveToken => "/save-token";

  static String get search => "/search-offers";
  static String get getdestination => "/destinations";
  static String get getNotifications => "/view-notifications";
  static String get readNotifications => "/read-notification/";
  static String get deleteAccount => "/delete-account";
  static String get offerExist => "/search-offer-exist";
}
