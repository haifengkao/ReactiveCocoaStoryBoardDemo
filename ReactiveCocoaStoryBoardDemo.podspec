#
# Be sure to run `pod lib lint ReactiveCocoaStoryBoardDemo.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ReactiveCocoaStoryBoardDemo"
  s.version          = "0.1.0"
  s.summary          = "A short description of ReactiveCocoaStoryBoardDemo."
  s.description      = <<-DESC
                       An optional longer description of ReactiveCocoaStoryBoardDemo

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/<GITHUB_USERNAME>/ReactiveCocoaStoryBoardDemo"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Hai Feng Kao" => "haifeng@cocoaspice.in" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/ReactiveCocoaStoryBoardDemo.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'ReactiveCocoaStoryBoardDemo' => ['Pod/Assets/*.jpg']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
