fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios appstore_ipa
```
fastlane ios appstore_ipa
```
Description of what the lane does

打App Store包
### ios adhoc
```
fastlane ios adhoc
```
打ad-hoc包
### ios get_profile
```
fastlane ios get_profile
```
私有任务，下载provisioning_profile通用Action
### ios all_profile
```
fastlane ios all_profile
```
下载所有provisioning_profile
### ios deploy
```
fastlane ios deploy
```
上传ipa到iTunesConnect，发布到App Store
### ios add_device
```
fastlane ios add_device
```

### ios snap_shot
```
fastlane ios snap_shot
```

### ios beta_pgyer
```
fastlane ios beta_pgyer
```
打包并上传测试版至蒲公英
### ios app_icon
```
fastlane ios app_icon
```
生成不同尺寸的icon
### ios upload_testflight
```
fastlane ios upload_testflight
```
上传已知的ipa包至testflight
### ios tests
```
fastlane ios tests
```
运行单元测试和UI测试

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
