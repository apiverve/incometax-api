/// Response models for the Income Tax Brackets API.

/// API Response wrapper.
class IncometaxResponse {
  final String status;
  final dynamic error;
  final IncometaxData? data;

  IncometaxResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory IncometaxResponse.fromJson(Map<String, dynamic> json) => IncometaxResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? IncometaxData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Income Tax Brackets API.

class IncometaxData {
  int? year;
  String? country;
  String? type;
  IncometaxDataBrackets? brackets;
  IncometaxDataStandardDeduction? standardDeduction;
  String? lastUpdated;

  IncometaxData({
    this.year,
    this.country,
    this.type,
    this.brackets,
    this.standardDeduction,
    this.lastUpdated,
  });

  factory IncometaxData.fromJson(Map<String, dynamic> json) => IncometaxData(
      year: json['year'],
      country: json['country'],
      type: json['type'],
      brackets: json['brackets'] != null ? IncometaxDataBrackets.fromJson(json['brackets']) : null,
      standardDeduction: json['standard_deduction'] != null ? IncometaxDataStandardDeduction.fromJson(json['standard_deduction']) : null,
      lastUpdated: json['lastUpdated'],
    );
}

class IncometaxDataBrackets {
  List<IncometaxDataBracketsSingleItem>? single;
  List<IncometaxDataBracketsMarriedFilingJointlyItem>? marriedFilingJointly;
  List<IncometaxDataBracketsMarriedFilingSeparatelyItem>? marriedFilingSeparately;
  List<IncometaxDataBracketsHeadOfHouseholdItem>? headOfHousehold;

  IncometaxDataBrackets({
    this.single,
    this.marriedFilingJointly,
    this.marriedFilingSeparately,
    this.headOfHousehold,
  });

  factory IncometaxDataBrackets.fromJson(Map<String, dynamic> json) => IncometaxDataBrackets(
      single: (json['single'] as List?)?.map((e) => IncometaxDataBracketsSingleItem.fromJson(e)).toList(),
      marriedFilingJointly: (json['married_filing_jointly'] as List?)?.map((e) => IncometaxDataBracketsMarriedFilingJointlyItem.fromJson(e)).toList(),
      marriedFilingSeparately: (json['married_filing_separately'] as List?)?.map((e) => IncometaxDataBracketsMarriedFilingSeparatelyItem.fromJson(e)).toList(),
      headOfHousehold: (json['head_of_household'] as List?)?.map((e) => IncometaxDataBracketsHeadOfHouseholdItem.fromJson(e)).toList(),
    );
}

class IncometaxDataBracketsSingleItem {
  double? rate;
  int? min;
  int? max;

  IncometaxDataBracketsSingleItem({
    this.rate,
    this.min,
    this.max,
  });

  factory IncometaxDataBracketsSingleItem.fromJson(Map<String, dynamic> json) => IncometaxDataBracketsSingleItem(
      rate: json['rate'],
      min: json['min'],
      max: json['max'],
    );
}

class IncometaxDataBracketsMarriedFilingJointlyItem {
  double? rate;
  int? min;
  int? max;

  IncometaxDataBracketsMarriedFilingJointlyItem({
    this.rate,
    this.min,
    this.max,
  });

  factory IncometaxDataBracketsMarriedFilingJointlyItem.fromJson(Map<String, dynamic> json) => IncometaxDataBracketsMarriedFilingJointlyItem(
      rate: json['rate'],
      min: json['min'],
      max: json['max'],
    );
}

class IncometaxDataBracketsMarriedFilingSeparatelyItem {
  double? rate;
  int? min;
  int? max;

  IncometaxDataBracketsMarriedFilingSeparatelyItem({
    this.rate,
    this.min,
    this.max,
  });

  factory IncometaxDataBracketsMarriedFilingSeparatelyItem.fromJson(Map<String, dynamic> json) => IncometaxDataBracketsMarriedFilingSeparatelyItem(
      rate: json['rate'],
      min: json['min'],
      max: json['max'],
    );
}

class IncometaxDataBracketsHeadOfHouseholdItem {
  double? rate;
  int? min;
  int? max;

  IncometaxDataBracketsHeadOfHouseholdItem({
    this.rate,
    this.min,
    this.max,
  });

  factory IncometaxDataBracketsHeadOfHouseholdItem.fromJson(Map<String, dynamic> json) => IncometaxDataBracketsHeadOfHouseholdItem(
      rate: json['rate'],
      min: json['min'],
      max: json['max'],
    );
}

class IncometaxDataStandardDeduction {
  int? single;
  int? marriedFilingJointly;
  int? marriedFilingSeparately;
  int? headOfHousehold;

  IncometaxDataStandardDeduction({
    this.single,
    this.marriedFilingJointly,
    this.marriedFilingSeparately,
    this.headOfHousehold,
  });

  factory IncometaxDataStandardDeduction.fromJson(Map<String, dynamic> json) => IncometaxDataStandardDeduction(
      single: json['single'],
      marriedFilingJointly: json['married_filing_jointly'],
      marriedFilingSeparately: json['married_filing_separately'],
      headOfHousehold: json['head_of_household'],
    );
}

class IncometaxRequest {
  String country;
  int? year;

  IncometaxRequest({
    required this.country,
    this.year,
  });

  Map<String, dynamic> toJson() => {
      'country': country,
      if (year != null) 'year': year,
    };
}
