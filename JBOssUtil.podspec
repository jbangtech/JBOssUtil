#
# Be sure to run `pod lib lint JBOssUtil.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JBOssUtil'
  s.version          = '0.1.0'
  s.summary          = 'JBOssUtil.'

  s.homepage         = 'https://github.com/jbangtech/JBOssUtil'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'echanz' => 'echan96@dingtalk.com' }
  s.source           = { :git => 'https://github.com/jbangtech/JBOssUtil.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_versions = ['5.1', '5.2', '5.3', '5.4', '5.5', '5.6']
  s.static_framework = true
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}

  s.source_files = 'JBOssUtil/Classes/*.framework/Headers/*.{h}'
  s.vendored_frameworks = 'JBOssUtil/Classes/*.framework'
  
  s.dependency 'Alamofire', '~> 5.4.2'
  s.dependency 'MBProgressHUD', '~> 1.2.0'
  s.dependency 'AliyunOSSiOS', '~> 2.10.8'
  
end
