//
//  AppDelegate.swift
//  carLoan
//
//  Created by developer on 2019/7/23.
//  Copyright © 2019年 developer. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // 友盟统计
        MobClick.setAutoPageEnabled(true)
        UMConfigure.initWithAppkey("5d3ea3713fc19521aa000679", channel: "iOS")
        
        
        let main = MainViewController()
        // 未选中状态Tab图片
        main.tabBarItem.image = UIImage(named: "tb0")?.withRenderingMode(.alwaysOriginal)
        // 选中状态Tab图片
        //wechat.tabBarItem.selectedImage = UIImage(named: "selectTab1")?.withRenderingMode(.alwaysOriginal)
        main.tabBarItem.title = "计算器"
        let nav0 = UINavigationController(rootViewController: main)
        let news = NewsViewController()
        news.tabBarItem.title = "车市新闻"
        news.tabBarItem.image = UIImage(named: "tb1")?.withRenderingMode(.alwaysOriginal)
        let nav1 = UINavigationController(rootViewController: news)
        
        let about = AboutViewController()
        about.tabBarItem.title = "关于我们"
        about.tabBarItem.image = UIImage(named: "tb2")?.withRenderingMode(.alwaysOriginal)
        let nav2 = UINavigationController(rootViewController: about)
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.barTintColor = UIColor.white
        tabBarController.tabBar.isTranslucent = false
        // tabBarController的主题颜色
        //tabBarController.tabBar.tintColor = UIColor.init(colorLiteralRed: 9/255.0, green: 187/255.0, blue: 7/255.0, alpha: 1)
        // tabBarController的子视图控制器集合
        tabBarController.viewControllers = [nav0,nav1,nav2]
        // 添加到rootViewController
        window?.rootViewController = tabBarController
        
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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "carLoan")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

