#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "APLPageViewControllerDataSource"
  s.version          = "0.1.0"
  s.summary          = "A short description of APLPageViewControllerDataSource."
  s.description      = <<-DESC
                       An optional longer description of APLPageViewControllerDataSource

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "http://EXAMPLE/NAME"
  s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Tobias Conradi" => "tconradi@apploft.de" }
  s.source           = { :git => "https://github.com/apploft/APLPageViewControllerDataSource.git", :tag => s.version.to_s }

  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  s.requires_arc = true

  s.source_files  = 'Classes', 'Classes/**/*.{h,m}'
  s.public_header_files = 'Classes/**/*.h'
end
