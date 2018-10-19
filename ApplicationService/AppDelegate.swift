//
//  AppDelegate.swift
//  ApplicationService
//
//  Created by BENSALA on 19/10/2018.
//  Copyright © 2018 BENSALA. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: PluggableApplicationDelegate {
    override func services() -> [ApplicationService] {
        return [
            DependencyApplicationService(),
            LoggerApplicationService()
        ]
    }
}

final class LoggerApplicationService: ApplicationService {
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        print("willFinish LoggerApplicationService")
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        print("didFinish LoggerApplicationService")
        return true
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        print("App did receive memory warning.")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("App will terminate.")
    }
}

final class DependencyApplicationService: ApplicationService {
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        configure(dependency: AppDependency())
        return true
    }
}
