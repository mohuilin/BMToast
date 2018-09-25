Pod::Spec.new do |s|
    s.name        = "BMToast"
    s.version      = "1.0.0"
    s.summary      = "BMToast"
    s.homepage    = "https://github.com/mohuilin/BMToast"
    s.author      = { "kiven" => "56434735@qq.com" }
    s.platform    = :ios, "9.0"
    s.source      = { :git => "https://github.com/mohuilin/BMToast.git", :tag => s.version }
    s.source_files  = "BMToast", "BMToast/*.{h,m}"
    s.framework  = "UIKit"
    s.requires_arc = true
end
