#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "SMQuickSegue"
  s.version      = "0.1.0"
  s.summary      = "Quick parameter setting with storyboard segues"
  s.description  =  "WorkInProgress"
  s.homepage     = "http://www.stefanomondino.com"
  s.license      = 'MIT'
  s.author       = { "Stefano Mondino" => "stefano.mondino.dev@gmail.com" }
   s.source   = { :git => 'git@github.com:stefanomondino/SMQuickSegue.git' }

  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  s.requires_arc = true

  s.source_files = 'Classes/**/*.{m,h}'
  s.resources = 'Assets'

  s.public_header_files = 'Classes/**/*.h'

end
