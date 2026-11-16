/// Income Tax Brackets API client for Dart/Flutter
///
/// Income Tax Brackets retrieves US federal income tax brackets, marginal rates, and standard deductions across all filing statuses, and with state=CA (any state or DC) adds that state's brackets, standard deduction and personal exemption. Paid plans can query specific historical tax years back to 2000.
///
/// For more information, visit: https://apiverve.com/marketplace/incometax?utm_source=dart&utm_medium=referral&utm_content=readme
library apiverve_incometax;

export 'src/client.dart';
export 'src/models.dart';
