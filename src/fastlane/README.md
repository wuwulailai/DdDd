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
### ios adhoc_profile
```
fastlane ios adhoc_profile
```
下载provisioning_profile
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

### ios app_icon
```
fastlane ios app_icon
```
生成不同尺寸的icon

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
