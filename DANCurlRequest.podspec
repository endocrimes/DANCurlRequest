Pod::Spec.new do |s|
    s.name                  = "DANCurlRequest"
    s.version               = "1.0.1"
    s.summary               = "Easily log NSURLRequest's as curl commands"
    s.homepage              = "https://github.com/endocrimes/#{s.name}"
    s.license               = { :type => "MIT", :file => "LICENSE" }
    s.author                = { "Danielle Lancashire" => "dani@builds.terrible.systems" }
    s.social_media_url      = "https://twitter.com/endocrimes"
    s.ios.deployment_target = "7.0"
    s.osx.deployment_target = "10.9" 
    s.source                = { :git => "#{s.homepage}.git", :tag => s.version }
    s.source_files          = s.name, "#{s.name}/**/*.{h,m}"
    s.requires_arc          = true
end
