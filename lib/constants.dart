library constants;

class Route {
  static const String root = "/";
  static const String splash = "/splash";
  static const String auth = "/auth";
  static const String settings = "/settings";
  static const String home = "/home";
  static const String submitFeedback = "/submitFeedback";
  static const String viewFeedback = "/viewFeedback";
  static const String profile = "/profile";
  static const String logout =
      "/logout"; //Pseudo route, controls an action in the drawer not a screen navigation
}

class Image {
  static const String logo = "assets/images/SOS_Shield.png";
}

class Limit {
  static const int passwordSize = 128;
  static const int emailSize = 35;
  static const int nameSize = 35;
  static const int flightSize = 3;
  static const int feedbackSize = 3500;
  static const int minFeedbackSize = 30;
}