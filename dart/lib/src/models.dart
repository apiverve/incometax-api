/// Response models for the Income Tax Brackets API.

/// API Response wrapper.
class IncometaxResponse {
  final String status;
  final dynamic error;
  final IncometaxData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  IncometaxResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory IncometaxResponse.fromJson(Map<String, dynamic> json) => IncometaxResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? IncometaxData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Income Tax Brackets API.

class IncometaxData {
  num? year;
  String? country;
  String? type;
  IncometaxDataBrackets? brackets;
  IncometaxDataStandardDeduction? standardDeduction;
  String? lastUpdated;
  IncometaxDataMarriagepenalty? marriagePenalty;
  IncometaxDataEffectiveratecurve? effectiveRateCurve;
  IncometaxDataChanges? changes;

  IncometaxData({
    this.year,
    this.country,
    this.type,
    this.brackets,
    this.standardDeduction,
    this.lastUpdated,
    this.marriagePenalty,
    this.effectiveRateCurve,
    this.changes,
  });

  factory IncometaxData.fromJson(Map<String, dynamic> json) => IncometaxData(
      year: json['year'],
      country: json['country'],
      type: json['type'],
      brackets: json['brackets'] != null ? IncometaxDataBrackets.fromJson(json['brackets']) : null,
      standardDeduction: json['standard_deduction'] != null ? IncometaxDataStandardDeduction.fromJson(json['standard_deduction']) : null,
      lastUpdated: json['lastUpdated'],
      marriagePenalty: json['marriagePenalty'] != null ? IncometaxDataMarriagepenalty.fromJson(json['marriagePenalty']) : null,
      effectiveRateCurve: json['effectiveRateCurve'] != null ? IncometaxDataEffectiveratecurve.fromJson(json['effectiveRateCurve']) : null,
      changes: json['changes'] != null ? IncometaxDataChanges.fromJson(json['changes']) : null,
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
  num? rate;
  num? min;
  num? max;

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
  num? rate;
  num? min;
  num? max;

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
  num? rate;
  num? min;
  num? max;

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
  num? rate;
  num? min;
  num? max;

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
  num? single;
  num? marriedFilingJointly;
  num? marriedFilingSeparately;
  num? headOfHousehold;

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

class IncometaxDataMarriagepenalty {
  num? appliesFromRate;
  num? singleThreshold;
  num? jointThreshold;
  num? jointShortfall;

  IncometaxDataMarriagepenalty({
    this.appliesFromRate,
    this.singleThreshold,
    this.jointThreshold,
    this.jointShortfall,
  });

  factory IncometaxDataMarriagepenalty.fromJson(Map<String, dynamic> json) => IncometaxDataMarriagepenalty(
      appliesFromRate: json['appliesFromRate'],
      singleThreshold: json['singleThreshold'],
      jointThreshold: json['jointThreshold'],
      jointShortfall: json['jointShortfall'],
    );
}

class IncometaxDataEffectiveratecurve {
  List<IncometaxDataEffectiveratecurveSingleItem>? single;
  List<IncometaxDataEffectiveratecurveMarriedFilingJointlyItem>? marriedFilingJointly;
  List<IncometaxDataEffectiveratecurveMarriedFilingSeparatelyItem>? marriedFilingSeparately;
  List<IncometaxDataEffectiveratecurveHeadOfHouseholdItem>? headOfHousehold;

  IncometaxDataEffectiveratecurve({
    this.single,
    this.marriedFilingJointly,
    this.marriedFilingSeparately,
    this.headOfHousehold,
  });

  factory IncometaxDataEffectiveratecurve.fromJson(Map<String, dynamic> json) => IncometaxDataEffectiveratecurve(
      single: (json['single'] as List?)?.map((e) => IncometaxDataEffectiveratecurveSingleItem.fromJson(e)).toList(),
      marriedFilingJointly: (json['married_filing_jointly'] as List?)?.map((e) => IncometaxDataEffectiveratecurveMarriedFilingJointlyItem.fromJson(e)).toList(),
      marriedFilingSeparately: (json['married_filing_separately'] as List?)?.map((e) => IncometaxDataEffectiveratecurveMarriedFilingSeparatelyItem.fromJson(e)).toList(),
      headOfHousehold: (json['head_of_household'] as List?)?.map((e) => IncometaxDataEffectiveratecurveHeadOfHouseholdItem.fromJson(e)).toList(),
    );
}

class IncometaxDataEffectiveratecurveSingleItem {
  num? income;
  num? taxableIncome;
  num? tax;
  num? effectiveRate;
  num? marginalRate;

  IncometaxDataEffectiveratecurveSingleItem({
    this.income,
    this.taxableIncome,
    this.tax,
    this.effectiveRate,
    this.marginalRate,
  });

  factory IncometaxDataEffectiveratecurveSingleItem.fromJson(Map<String, dynamic> json) => IncometaxDataEffectiveratecurveSingleItem(
      income: json['income'],
      taxableIncome: json['taxableIncome'],
      tax: json['tax'],
      effectiveRate: json['effectiveRate'],
      marginalRate: json['marginalRate'],
    );
}

class IncometaxDataEffectiveratecurveMarriedFilingJointlyItem {
  num? income;
  num? taxableIncome;
  num? tax;
  num? effectiveRate;
  num? marginalRate;

  IncometaxDataEffectiveratecurveMarriedFilingJointlyItem({
    this.income,
    this.taxableIncome,
    this.tax,
    this.effectiveRate,
    this.marginalRate,
  });

  factory IncometaxDataEffectiveratecurveMarriedFilingJointlyItem.fromJson(Map<String, dynamic> json) => IncometaxDataEffectiveratecurveMarriedFilingJointlyItem(
      income: json['income'],
      taxableIncome: json['taxableIncome'],
      tax: json['tax'],
      effectiveRate: json['effectiveRate'],
      marginalRate: json['marginalRate'],
    );
}

class IncometaxDataEffectiveratecurveMarriedFilingSeparatelyItem {
  num? income;
  num? taxableIncome;
  num? tax;
  num? effectiveRate;
  num? marginalRate;

  IncometaxDataEffectiveratecurveMarriedFilingSeparatelyItem({
    this.income,
    this.taxableIncome,
    this.tax,
    this.effectiveRate,
    this.marginalRate,
  });

  factory IncometaxDataEffectiveratecurveMarriedFilingSeparatelyItem.fromJson(Map<String, dynamic> json) => IncometaxDataEffectiveratecurveMarriedFilingSeparatelyItem(
      income: json['income'],
      taxableIncome: json['taxableIncome'],
      tax: json['tax'],
      effectiveRate: json['effectiveRate'],
      marginalRate: json['marginalRate'],
    );
}

class IncometaxDataEffectiveratecurveHeadOfHouseholdItem {
  num? income;
  num? taxableIncome;
  num? tax;
  num? effectiveRate;
  num? marginalRate;

  IncometaxDataEffectiveratecurveHeadOfHouseholdItem({
    this.income,
    this.taxableIncome,
    this.tax,
    this.effectiveRate,
    this.marginalRate,
  });

  factory IncometaxDataEffectiveratecurveHeadOfHouseholdItem.fromJson(Map<String, dynamic> json) => IncometaxDataEffectiveratecurveHeadOfHouseholdItem(
      income: json['income'],
      taxableIncome: json['taxableIncome'],
      tax: json['tax'],
      effectiveRate: json['effectiveRate'],
      marginalRate: json['marginalRate'],
    );
}

class IncometaxDataChanges {
  num? versusYear;
  num? indexingPercent;
  IncometaxDataChangesBracketshifts? bracketShifts;
  IncometaxDataChangesStandarddeduction? standardDeduction;

  IncometaxDataChanges({
    this.versusYear,
    this.indexingPercent,
    this.bracketShifts,
    this.standardDeduction,
  });

  factory IncometaxDataChanges.fromJson(Map<String, dynamic> json) => IncometaxDataChanges(
      versusYear: json['versusYear'],
      indexingPercent: json['indexingPercent'],
      bracketShifts: json['bracketShifts'] != null ? IncometaxDataChangesBracketshifts.fromJson(json['bracketShifts']) : null,
      standardDeduction: json['standardDeduction'] != null ? IncometaxDataChangesStandarddeduction.fromJson(json['standardDeduction']) : null,
    );
}

class IncometaxDataChangesBracketshifts {
  List<IncometaxDataChangesBracketshiftsSingleItem>? single;
  List<IncometaxDataChangesBracketshiftsMarriedFilingJointlyItem>? marriedFilingJointly;
  List<IncometaxDataChangesBracketshiftsMarriedFilingSeparatelyItem>? marriedFilingSeparately;
  List<IncometaxDataChangesBracketshiftsHeadOfHouseholdItem>? headOfHousehold;

  IncometaxDataChangesBracketshifts({
    this.single,
    this.marriedFilingJointly,
    this.marriedFilingSeparately,
    this.headOfHousehold,
  });

  factory IncometaxDataChangesBracketshifts.fromJson(Map<String, dynamic> json) => IncometaxDataChangesBracketshifts(
      single: (json['single'] as List?)?.map((e) => IncometaxDataChangesBracketshiftsSingleItem.fromJson(e)).toList(),
      marriedFilingJointly: (json['married_filing_jointly'] as List?)?.map((e) => IncometaxDataChangesBracketshiftsMarriedFilingJointlyItem.fromJson(e)).toList(),
      marriedFilingSeparately: (json['married_filing_separately'] as List?)?.map((e) => IncometaxDataChangesBracketshiftsMarriedFilingSeparatelyItem.fromJson(e)).toList(),
      headOfHousehold: (json['head_of_household'] as List?)?.map((e) => IncometaxDataChangesBracketshiftsHeadOfHouseholdItem.fromJson(e)).toList(),
    );
}

class IncometaxDataChangesBracketshiftsSingleItem {
  num? rate;
  num? from;
  num? to;
  num? shiftPercent;

  IncometaxDataChangesBracketshiftsSingleItem({
    this.rate,
    this.from,
    this.to,
    this.shiftPercent,
  });

  factory IncometaxDataChangesBracketshiftsSingleItem.fromJson(Map<String, dynamic> json) => IncometaxDataChangesBracketshiftsSingleItem(
      rate: json['rate'],
      from: json['from'],
      to: json['to'],
      shiftPercent: json['shiftPercent'],
    );
}

class IncometaxDataChangesBracketshiftsMarriedFilingJointlyItem {
  num? rate;
  num? from;
  num? to;
  num? shiftPercent;

  IncometaxDataChangesBracketshiftsMarriedFilingJointlyItem({
    this.rate,
    this.from,
    this.to,
    this.shiftPercent,
  });

  factory IncometaxDataChangesBracketshiftsMarriedFilingJointlyItem.fromJson(Map<String, dynamic> json) => IncometaxDataChangesBracketshiftsMarriedFilingJointlyItem(
      rate: json['rate'],
      from: json['from'],
      to: json['to'],
      shiftPercent: json['shiftPercent'],
    );
}

class IncometaxDataChangesBracketshiftsMarriedFilingSeparatelyItem {
  num? rate;
  num? from;
  num? to;
  num? shiftPercent;

  IncometaxDataChangesBracketshiftsMarriedFilingSeparatelyItem({
    this.rate,
    this.from,
    this.to,
    this.shiftPercent,
  });

  factory IncometaxDataChangesBracketshiftsMarriedFilingSeparatelyItem.fromJson(Map<String, dynamic> json) => IncometaxDataChangesBracketshiftsMarriedFilingSeparatelyItem(
      rate: json['rate'],
      from: json['from'],
      to: json['to'],
      shiftPercent: json['shiftPercent'],
    );
}

class IncometaxDataChangesBracketshiftsHeadOfHouseholdItem {
  num? rate;
  num? from;
  num? to;
  num? shiftPercent;

  IncometaxDataChangesBracketshiftsHeadOfHouseholdItem({
    this.rate,
    this.from,
    this.to,
    this.shiftPercent,
  });

  factory IncometaxDataChangesBracketshiftsHeadOfHouseholdItem.fromJson(Map<String, dynamic> json) => IncometaxDataChangesBracketshiftsHeadOfHouseholdItem(
      rate: json['rate'],
      from: json['from'],
      to: json['to'],
      shiftPercent: json['shiftPercent'],
    );
}

class IncometaxDataChangesStandarddeduction {
  IncometaxDataChangesStandarddeductionSingle? single;
  IncometaxDataChangesStandarddeductionMarriedFilingJointly? marriedFilingJointly;
  IncometaxDataChangesStandarddeductionMarriedFilingSeparately? marriedFilingSeparately;
  IncometaxDataChangesStandarddeductionHeadOfHousehold? headOfHousehold;

  IncometaxDataChangesStandarddeduction({
    this.single,
    this.marriedFilingJointly,
    this.marriedFilingSeparately,
    this.headOfHousehold,
  });

  factory IncometaxDataChangesStandarddeduction.fromJson(Map<String, dynamic> json) => IncometaxDataChangesStandarddeduction(
      single: json['single'] != null ? IncometaxDataChangesStandarddeductionSingle.fromJson(json['single']) : null,
      marriedFilingJointly: json['married_filing_jointly'] != null ? IncometaxDataChangesStandarddeductionMarriedFilingJointly.fromJson(json['married_filing_jointly']) : null,
      marriedFilingSeparately: json['married_filing_separately'] != null ? IncometaxDataChangesStandarddeductionMarriedFilingSeparately.fromJson(json['married_filing_separately']) : null,
      headOfHousehold: json['head_of_household'] != null ? IncometaxDataChangesStandarddeductionHeadOfHousehold.fromJson(json['head_of_household']) : null,
    );
}

class IncometaxDataChangesStandarddeductionSingle {
  num? from;
  num? to;
  num? change;
  num? changePercent;

  IncometaxDataChangesStandarddeductionSingle({
    this.from,
    this.to,
    this.change,
    this.changePercent,
  });

  factory IncometaxDataChangesStandarddeductionSingle.fromJson(Map<String, dynamic> json) => IncometaxDataChangesStandarddeductionSingle(
      from: json['from'],
      to: json['to'],
      change: json['change'],
      changePercent: json['changePercent'],
    );
}

class IncometaxDataChangesStandarddeductionMarriedFilingJointly {
  num? from;
  num? to;
  num? change;
  num? changePercent;

  IncometaxDataChangesStandarddeductionMarriedFilingJointly({
    this.from,
    this.to,
    this.change,
    this.changePercent,
  });

  factory IncometaxDataChangesStandarddeductionMarriedFilingJointly.fromJson(Map<String, dynamic> json) => IncometaxDataChangesStandarddeductionMarriedFilingJointly(
      from: json['from'],
      to: json['to'],
      change: json['change'],
      changePercent: json['changePercent'],
    );
}

class IncometaxDataChangesStandarddeductionMarriedFilingSeparately {
  num? from;
  num? to;
  num? change;
  num? changePercent;

  IncometaxDataChangesStandarddeductionMarriedFilingSeparately({
    this.from,
    this.to,
    this.change,
    this.changePercent,
  });

  factory IncometaxDataChangesStandarddeductionMarriedFilingSeparately.fromJson(Map<String, dynamic> json) => IncometaxDataChangesStandarddeductionMarriedFilingSeparately(
      from: json['from'],
      to: json['to'],
      change: json['change'],
      changePercent: json['changePercent'],
    );
}

class IncometaxDataChangesStandarddeductionHeadOfHousehold {
  num? from;
  num? to;
  num? change;
  num? changePercent;

  IncometaxDataChangesStandarddeductionHeadOfHousehold({
    this.from,
    this.to,
    this.change,
    this.changePercent,
  });

  factory IncometaxDataChangesStandarddeductionHeadOfHousehold.fromJson(Map<String, dynamic> json) => IncometaxDataChangesStandarddeductionHeadOfHousehold(
      from: json['from'],
      to: json['to'],
      change: json['change'],
      changePercent: json['changePercent'],
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
