Pod::Spec.new do |s|
    s.name                  = "DANCurlRequest"
    s.version               = "1.0.2"
    s.summary               = "Easily log NSURLRequest's as curl commands"
    s.homepage              = "https://github.com/DanToml/#{s.name}"
    s.license               = { :type => "MIT", :file => "LICENSE" }
    s.author                = { "Daniel Tomlinson" => "dan@tomlinson.io" }
    s.social_media_url      = "https://twitter.com/DanToml"
    s.ios.deployment_target = "7.0"
    s.osx.deployment_target = "10.9" 
    s.source                = { :git => "#{s.homepage}.git", :tag => s.version }
    s.source_files          = s.name, "#{s.name}/**/*.{h,m}"
    s.requires_arc          = true
end
