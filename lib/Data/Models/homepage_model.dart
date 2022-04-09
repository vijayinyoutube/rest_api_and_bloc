import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomePageModel {
  final String name;
  Object address;
  Object company;
  HomePageModel({
    required this.name,
    required this.address,
    required this.company,
  });

  HomePageModel copyWith({
    String? name,
    Object? address,
    Object? company,
  }) {
    return HomePageModel(
      name: name ?? this.name,
      address: address ?? this.address,
      company: company ?? this.company,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address.toMap(),
      'company': company.toMap(),
    };
  }

  factory HomePageModel.fromMap(Map<String, dynamic> map) {
    return HomePageModel(
      name: map['name'] as String,
      address: Object.fromMap(map['address'] as Map<String,dynamic>),
      company: Object.fromMap(map['company'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomePageModel.fromJson(String source) => HomePageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HomePageModel(name: $name, address: $address, company: $company)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is HomePageModel &&
      other.name == name &&
      other.address == address &&
      other.company == company;
  }

  @override
  int get hashCode => name.hashCode ^ address.hashCode ^ company.hashCode;
}





