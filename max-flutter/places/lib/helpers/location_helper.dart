import 'package:flutter/foundation.dart';

import '../env.dart';

String generateLocationPreviewImage(
        {@required double latitude, @required double longitude}) =>
    'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
