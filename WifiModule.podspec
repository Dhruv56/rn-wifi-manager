require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "WifiModule"
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['repository']['url']
  s.platform     = :ios, "11.0"
<<<<<<< HEAD
  s.ios.deployment_target = "11.0"

  s.source       = { :git => "https://github.com/Dhruv56/rn-wifi-manager.git", :tag => "v#{s.version}" }
  s.source_files  = "ios/**/*.{h,m}"

  s.dependency 'React'
=======

  s.source       = { :git => "https://github.com/Dhruv56/rn-wifi-manager.git", :tag => "v#{s.version}" }
  s.source_files  = "ios/**/*.{h,m,swift}"

>>>>>>> 4f310387180c3cd6596439d9f7db3a34be2d17d7
end