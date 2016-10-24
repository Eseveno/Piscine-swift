#
# Be sure to run `pod lib lint eseveno2016.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'eseveno2016'
s.version          = '0.1.0'
s.summary          = 'litle pod from 42'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
Super pod pour faire une BDD , ajout d'article t'es moche guilhem lel'
DESC

s.homepage         = 'https://www.google.com'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'seveno' => 'seveno.erwan@gmail.com' }
s.source           = { :git => 'https://github.com/<GITHUB_USERNAME>/eseveno2016.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '8.0'

s.source_files = 'eseveno2016/Classes/**/*'

# s.resource_bundles = {
#   'eseveno2016' => ['eseveno2016/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
s.frameworks = 'UIKit', 'MapKit', 'Coredata'
# s.dependency 'AFNetworking', '~> 2.3'
end
