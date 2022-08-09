//
//  AppDelegate.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/8.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UITabBar.appearance().tintColor = .orange
        
        return true
    }
}

