Pod::Spec.new do |s|
  s.name         = "CHGIFRefreshControl"
  s.version      = "0.1"
  s.summary      = "\"Twitter music\" and \"Yahoo! Weather\" like pull-to-refresh control created using GIF. "
  s.screenshots  = "https://raw.github.com/cyndibaby905/GIFRefreshControl/master/TwitterMusic.gif", "https://raw.github.com/cyndibaby905/GIFRefreshControl/master/YahooWeather.gif", "https://raw.github.com/cyndibaby905/GIFRefreshControl/master/Chrome.gif", "https://raw.github.com/cyndibaby905/GIFRefreshControl/master/Universe.gif", "https://raw.github.com/cyndibaby905/GIFRefreshControl/master/MacOSX.gif", "https://raw.github.com/cyndibaby905/GIFRefreshControl/master/Windows.gif"
  s.homepage     = "https://github.com/cyndibaby905/GIFRefreshControl"
  s.license      = { :type => 'MIT License', :file => 'LICENSE' }
  s.author       = { "cyndibaby905" => "hangisnice@gmail.com" }
  s.source       = { :git => "https://github.com/cyndibaby905/GIFRefreshControl.git", :tag => "0.1" }
  s.platform     = :ios, '5.0'
  s.source_files = 'CHGifRefreshControl/CHGifRefreshControl/UIScrollView+GifPullToRefresh.{h,m}'
  s.requires_arc = true
end