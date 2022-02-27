require 'appium_lib_core'
require 'appium_flutter_finder'

require 'minitest/autorun'

class ExampleTests < Minitest::Test
  include ::Appium::Flutter::Finder

  CAPS = {
    caps: {
      platformName: 'Android',
      automationName: 'flutter',
      udid: '3247484e36443498', #Also tried emulator
      appPackage: 'com.sofi.mobile',
      appActivity: '.login.splashscreen.SplashScreenActivity',
      deviceName: 'Android',
      app: '/Users/smalugu/code/wealth-android/app/build/outputs/apk/debug/app-debug.apk'
    },
    appium_lib: {
      export_session: true,
      wait_timeout: 20,
      wait_interval: 1
    }
  }.freeze

  def test_run_example_android
    @core = ::Appium::Core.for(CAPS)
    @driver = @core.start_driver

    @driver.context = 'NATIVE_APP'

    element = @driver.find_element :id, 'id:com.sofi.mobile:id/login_button'
    element.click
    #Add login code

    @driver.context = 'FLUTTER'

  end
end
