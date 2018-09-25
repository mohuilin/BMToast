Pod::Spec.new do |s|
    s.name             = "BMToast"
    s.version          = "1.0.2"
    s.summary          = "BMToast"
    s.license          = 'MIT'
    s.homepage         = "https://github.com/mohuilin/BMToast"
    s.author           = { "kiven" => "56434735@qq.com" }
    s.source           = { :git => 'https://github.com/mohuilin/BMToast.git', :tag => s.version }
    s.platform         = :ios, "9.0"
    s.source_files     = "BMToast/*.{h,m}"
    s.resources = "BMToast/BMToast.bundle"
end
