//
//  AppDelegate.swift
//  DdDd
//
//  Created by wubaolai on 2018/8/20.
//  Copyright © 2018年 wubaolai. All rights reserved.
//

import UIKit
import Log

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        chooseLaunchViewController()
        initLog()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

private extension AppDelegate {
    func initLog() {
        // Add a stenography handler to keep track of all log records **for display purposes in this sample App only**
        #if DISTRIBUTION
            Log.logLevel = .off
        #else
            Log.logLevel = .all
        #endif
        Log.info("初始化日志")
    }
}

private extension AppDelegate {
    static let shortVersionKey = "short.version.key"
    
    var launchViewController: UIViewController {
        func currentViewController() -> UIViewController {
            if isHiddenNewFeature {
                return DashboardViewController() // 主页
            } else {
                let controller = NewFeatureViewController() // 新特性
                controller.onFinishedHandler = {
                    // 保存当前版本
                    UserDefaults.standard.setValue(self.currentVersion, forKey: AppDelegate.shortVersionKey)
                    self.window?.rootViewController = currentViewController()
                }
                
                return controller
            }
        }
        
        return currentViewController()
    }
    
    var currentVersion: String {
        guard let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return ""
        }
        return currentVersion
    }
    
    var isHiddenNewFeature: Bool {
        guard let version = UserDefaults.standard.string(forKey: AppDelegate.shortVersionKey) else {
            return false
        }
        
        if currentVersion > version {
            return false
        }
        
        return true
    }
    
    func chooseLaunchViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = launchViewController
        self.window?.makeKeyAndVisible()
    }
}

