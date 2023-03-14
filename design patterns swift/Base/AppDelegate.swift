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
        
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    
        FirebaseApp.configure()
        requestNotificationAuthorithation()
        return true
    }
    
    private func requestNotificationAuthorithation() {
        let nc = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        
        nc.requestAuthorization(options: options) { haveAccess, _ in
            print("(we have access to send notifications to user \(haveAccess))")
                   guard haveAccess else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    private func requestToSilentNotificationAuthorithation() {
        let nc = UNUserNotificationCenter.current()
        var options = UNAuthorizationOptions()
        
        if #available(iOS 12.0, *) {
            options.insert(.provisional)
        }
        
        nc.requestAuthorization(options: options) { haveAccess, _ in
            print("(we have access to send silent notifications to user \(haveAccess))")
        }
    }
    
    private func getNotificationsSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            print("we have to sent \(settings)")
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(deviceToken, "Device Token")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("error from token", error.localizedDescription)
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate { }
