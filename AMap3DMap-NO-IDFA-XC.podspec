# zipfile = "#{__dir__}/output/AMap3DMap-NO-IDFA.zip"

Pod::Spec.new do |s|
  s.name             = 'AMap3DMap-NO-IDFA-XC'
  s.version          = '9.7.0'
  s.summary          = 'A xcframework based AMap3DMap-NO-IDFA Support ARM64 simulator'
  
  s.description      = <<-DESC
  This pod is built for AMap3DMap-NO-IDFA xcframework. See: https://github.com/SouHanaQiao/AMap3DMap-NO-IDFA-X.git
  DESC
  s.homepage         = 'https://github.com/SouHanaQiao/AMap3DMap-NO-IDFA-XC'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :text => <<-LICENSE
    MIT License
    
    Copyright (c) 2023 YorkZero
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
      
      The above copyright notice and this permission notice shall be included in all
      copies or substantial portions of the Software.
      
      THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
      IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
      FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
      AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
      LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
      OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
      SOFTWARE.
      
      LICENSE
      }
      s.author           = { 'souahaqiao' => 'wangqinqian@126.com' }
#      s.source           = { :path => './output/AMap3DMap-NO-IDFA/MAMapKit.xcframework' }
      #s.source = { :http => "file://#{zipfile}"}
     s.source = { :http => "https://github.com/SouHanaQiao/AMap3DMap-NO-IDFA-XC/releases/download/9.7.0/AMap3DMap-NO-IDFA.zip"}
      
      # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
      
      platform = :ios, '11.0'
      
      
      s.ios.deployment_target = '11.0'
      
      s.vendored_frameworks = ['MAMapKit.xcframework']
      s.resource = 'AMap.bundle'
      
      s.frameworks = 'UIKit', 'Foundation', 'CFNetwork', 'SystemConfiguration', 'QuartzCore', 'CoreGraphics', 'CoreMotion', 'CoreTelephony', 'GLKit'
      s.libraries = 'c++', 'z'
      
      s.dependency 'AMapFoundation-NO-IDFA-XC'
    end
