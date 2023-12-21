//
//  AppDelegate.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 21.12.2023.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        // get openai api key
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
            let keys: NSDictionary = NSDictionary(contentsOfFile: path),
            let key = keys["chatAPIKey"] as? String {
                Constants.apiKey = key
        }
        
        return true
    }
    
}
