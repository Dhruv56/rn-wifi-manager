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

  s.source       = { :git => "https://github.com/Dhruv56/rn-wifi-manager.git", :tag => "v#{s.version}" }
  s.source_files  = "ios/**/*.{h,m,swift}"

end