#
# Be sure to run `pod lib lint ASNetworkTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AriSwift'
  s.version          = '4'
  s.summary          = '分类工具库'
  s.swift_version    = '4.2'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    分类工具库
                       DESC

  s.homepage         = 'https://github.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AriSwift' => '6937523@qq.com' }
  s.source           = { :git => 'https://github.com/AnnieAri/AriSwift.git', :tag => s.version.to_s }
  s.source_files = 'AriSwift/AriSwift/CommonTools/*.swift','AriSwift/AriSwift/CommonTools/Extension/*.swift','AriSwift/AriSwift/CommonTools/Protocol/*.swift'
  s.ios.deployment_target = '9.0'
end
