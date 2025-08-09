import 'package:anystep/core/features/location/domain/address_model.dart';
import 'package:url_launcher/url_launcher.dart';

String buildAddressQuery(AddressModel address) {
  final parts =
      [
        address.street,
        if ((address.streetSecondary ?? '').isNotEmpty) address.streetSecondary,
        address.city,
        address.state,
        address.postalCode,
      ].where((part) => part != null && part.trim().isNotEmpty).toList();
  return Uri.encodeComponent(parts.join(', '));
}

Future<void> openMap(AddressModel address) async {
  final query =
      address.latitude != null && address.longitude != null
          ? Uri.encodeComponent('${address.latitude}, ${address.longitude}')
          : buildAddressQuery(address);
  final googleMapsUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$query');
  if (await canLaunchUrl(googleMapsUrl)) {
    await launchUrl(googleMapsUrl);
  } else {
    throw 'Could not launch map';
  }
}
