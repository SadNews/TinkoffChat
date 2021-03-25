//
//  AppDelegate.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 18.02.2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        print("Application moved from \"Not running\" to \"Foreground(Inactive)\": \(#function)")
        let conversationListVC = ConversationsListViewController()
        let navigationController = BaseNavigationController(rootViewController: conversationListVC)
        
        setUserData(vc: conversationListVC)
        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        Appearance.shared.setupTheme()

        FirebaseApp.configure()
        
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
    
    private func setUserData(vc: ConversationsListViewController) {
        let dataManager = GCDDataManager()
        //let dataManager = OperationDataManager()
        
        GCDDataManager().loadPersonData { personViewModel in
            if personViewModel == nil {
                dataManager.savePersonData(.init(fullName: "Andrey Ushakov",
                                                 description: "iOS developer\nMoscow",
                                                 profileImage: nil)) { _ in vc.loadData() }
            }
        }
    }
    
}

