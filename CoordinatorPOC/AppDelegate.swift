//
//  AppDelegate.swift
//  CoordinatorPOC
//
//  Created by Ezequiel Gutierrez on 07/08/2019.
//  Copyright © 2019 Ezequiel Gutierrez. All rights reserved.
//

import CoreBluetooth
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // create the main navigation controller to be used for our app
        let navController = UINavigationController()

        // send that into our coordinator so that it can display view controllers
        //let mainVc = MainViewController.instantiate()
        
         let mainVc = MainViewController()
        
        // create a basic UIWindow and activate it
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        navController.pushViewController(mainVc, animated: true)
        return true
    }

    private func initStoreFravega() -> StoresEntity { // TODO: REEMPLAZAR !!
        let storeA = StoreEntity(name: "ALCORTA", location: "ARGENTINA", number: 2, hasPlace: true)
        let storeB = StoreEntity(name: "DOT", location: "ARGENTINA", number: 3, hasPlace: true)
        let storeC = StoreEntity(name: "ALTO PALERMO", location: "ARGENTINA", number: 4, hasPlace: true)
        let storeD = StoreEntity(name: "PACIFICO", location: "ARGENTINA", number: 5, hasPlace: true)
        let fravega = StoresEntity(stores: [storeA, storeB, storeC, storeD])
        return fravega
    }

    func applicationWillResignActive(_: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
