#
#  Be sure to run `pod spec lint DeathNote.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "DeathNote"
  spec.version      = "1.0.1"
  spec.summary      = "Nothing similar with the actual DeathNote."
  spec.description  = "I wish I wrote more, but it is already 2 AM."

  spec.homepage     = "https://github.com/Danylkko/DeathNote"
  spec.license      = "MIT"

  spec.author             = { "Danylo Litvinchuk" => "ltvnchkd@gmail.com" }

  spec.platform     = :ios, "16.4"
  spec.swift_versions = "5.0"

  spec.source       = { :git => "https://github.com/Danylkko/DeathNote.git", :tag => spec.version.to_s }

  spec.source_files  = "DeathNote/**/*"
  spec.exclude_files = "DeathNote/.docc-build"

  # spec.dependency "JSONKit", "~> 1.4"

end
