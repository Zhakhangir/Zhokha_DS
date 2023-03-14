//
//  AppDelegate.swift
//  design patterns swift
//
//  Created by Жахaнгир Таиров on 02.03.2023.
//

import UIKit
import UserNotifications
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().delegate = self
    
        let pushManager = PushNotificationManager(userID: "tam_tam_tam")
        pushManager.registerForPushNotifications()
        FirebaseApp.configure()
        
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    
        
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate { }
