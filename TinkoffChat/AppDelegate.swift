//
//  AppDelegate.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 18.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("Application moved from \"Not running\" to \"Foreground(Inactive)\": \(#function)")
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("Application will be moved from \"Foreground(Active)\" to \"Foreground(Inactive)\": \(#function)")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Application moved from \"Foreground(Inactive)\" to \"Background\": \(#function)")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Application will be moved from \"Background\" to \"Foreground\": \(#function)")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Application moved from \"Foreground(Inactive)\" to \"Foreground(Active)\": \(#function)")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("Application will moved from \"Background\" to \"Suspended\" and then to \"Not running\": \(#function)")
    }
    
}

