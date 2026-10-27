Pod::Spec.new do |s|
  s.name             = 'APIVerveIncomeTaxBrackets'
  s.version          = '1.2.3'
  s.summary          = 'Income Tax Brackets retrieves federal income tax brackets, marginal rates, and standard deductions across all US filing statuses.'
  s.description      = <<-'DESC'
Income Tax Brackets retrieves federal income tax brackets, marginal rates, and standard deductions across all US filing statuses. Paid plans can query specific historical tax years back to 2000.

This iOS/macOS SDK provides a convenient way to access the Income Tax Brackets from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/incometax?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/incometax-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveIncomeTaxBrackets/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
