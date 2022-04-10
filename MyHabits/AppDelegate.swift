//
//  AppDelegate.swift
//  MyHabits
//
//  Created by Shom on 29.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = UITabBarController()
        self.window?.rootViewController = tabBarController
        
        let habitsViewController = HabitsViewController()
        let habitsNavigationController = UINavigationController(rootViewController: habitsViewController)
        habitsNavigationController.tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(named: "habitsIcon"), selectedImage: nil)
        habitsViewController.view.backgroundColor = .white
        
        let infoViewController = InfoViewController()
        let infoNavigationController = UINavigationController(rootViewController: infoViewController)
        infoNavigationController.tabBarItem = UITabBarItem(title: "Информация", image: UIImage(named: "info"), selectedImage: nil)
        
        infoViewController.title = "Информация"
        infoViewController.view.backgroundColor = .white
        
        tabBarController.viewControllers = [habitsNavigationController, infoNavigationController]
        tabBarController.tabBar.isHidden = false
        tabBarController.tabBar.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = constPurpleColor
        UITabBar.appearance().tintColor = constPurpleColor
        
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        return true
        
    }
    
}

