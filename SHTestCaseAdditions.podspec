Pod::Spec.new do |s|
  name           = "SHTestCaseAdditions"
  url            = "https://github.com/seivan/#{name}"
  git_url        = "#{url}.git"
  version        = "1.2.1"
  source_files   = "#{name}/**/*.{h,m}"
  
  s.name         = name
  s.version      = version
  s.summary      = "Prefixed category on SenTestCase and XCTestCase to help with asynchronous callbacks."
  s.description  = <<-DESC
  
  SHTestCaseAdditions contains asynchronous helpers (as a prefixed category) to write tests in SentTest and/or XCTest for delayed callbacks, 
  like network calls or alert views, action sheets. Prefixed category on SenTestCase and XCTestCase

                    * Swizzle and junk free
                    * Prefixed selectors.
                    * Works with both SentTest and/or XCTest
                    * For iOS and Mac OS
                    * Comes with tests and example. 
                    
                    DESC

  s.homepage     = url
  s.license      = 'MIT'
  s.author       = { "Seivan Heidari" => "seivan.heidari@icloud.com" }
  
  s.source       = { :git => git_url, :tag => version}
  
  xctest  = 'XCTest'
  sentest = 'SenTestingKit'

  s.subspec xctest do |xct|
    xct.frameworks    = [xctest]
    xct.source_files = "#{xctest}/#{source_files}"
  end

  s.subspec sentest do |sen|
    sen.frameworks   = [sentest]
    sen.source_files = "#{sentest}/#{source_files}"
  end


  s.requires_arc = true


end
