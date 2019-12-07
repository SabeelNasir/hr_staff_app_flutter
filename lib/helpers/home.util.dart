import 'package:cached_network_image/cached_network_image.dart';

class HomeUtil {
  CachedNetworkImageProvider getEmployeeImage(String empImageUrl) {
    return CachedNetworkImageProvider(empImageUrl);
  }
}
