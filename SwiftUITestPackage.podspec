Pod::Spec.new do |s|
    s.name             = "SwiftUITestPackage"
    s.version          = "0.0.1"
    s.summary          = "Testing SwiftUI package distribution"
  
    s.homepage         = 'https://github.com/djoksimo/SwiftUITestPackage.git'
    s.license          = 'MIT'
    s.author           = { 'djoksimo' => 'danilo@joinforage.com' }
    s.source           = { :git => 'https://github.com/djoksimo/SwiftUITestPackage.git', :tag => s.version.to_s }
  
    s.ios.deployment_target = '13.0'
    s.osx.deployment_target = '11.0'
    s.watchos.deployment_target = '10.0'
    
    s.requires_arc     = true
    s.swift_version    = '5.5'
  
    s.source_files = [
       'Sources/*.h',
       'Sources/*.swift',
       'Sources/**/*.swift'
    ]
  end
