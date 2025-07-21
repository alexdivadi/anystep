import 'package:json_annotation/json_annotation.dart';

part 'json_data.g.dart';

@JsonLiteral('countries.json')
Map<String, String> get countries => _$countriesJsonLiteral;

@JsonLiteral('states.json')
Map<String, String> get states => _$statesJsonLiteral;
