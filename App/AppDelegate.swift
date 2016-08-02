//
//  AppDelegate.swift
//  LockApp
//
//  Created by Hernan Zalazar on 6/22/16.
//  Copyright © 2016 Auth0. All rights reserved.
//

import UIKit
import Auth0

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        return Auth0.resumeAuth(url, options: options)
    }
}

