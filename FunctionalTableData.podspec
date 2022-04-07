Pod::Spec.new do |s|
  s.name             = 'FunctionalTableData'
  s.version          = '2.0.0'
  s.summary          = 'https://github.com/Agoujil2saad/FunctionalTableData'

  s.homepage         = 'https://github.com/Agoujil2saad/FunctionalTableData'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Agoujil2saad' => 'agoujilsaad@gmail.com' }
  s.source           = { :git => 'https://github.com/Agoujil2saad/FunctionalTableData', :branch => 'master' }

  s.ios.framework  = 'UIKit'
  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  s.dependency 'CwlCatchException', '~> 2.0'

  s.source_files = 'Sources/FunctionalTableData/**/*.{h,m,swift}'
end