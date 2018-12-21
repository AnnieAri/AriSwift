//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  AppDelegate+AS.swift 
//  AriSwift 
// 
//  Created by Ari on 2018/11/19. 
//  Copyright © 2018 AriSwift. All rights reserved. 	
// 

import Foundation
import UIKit
public extension AriSwift where Base: UIApplication {
    static var isNewVersion: Bool {
        let infoDic = Bundle.main.infoDictionary
        let currentVersion = infoDic?["CFBundleShortVersionString"] as? String
        
        // 2.2 获取之前存储的版本号
        let userDefault = UserDefaults.standard
        let oldVersion = userDefault.object(forKey: "app_version") as? String
        
        if oldVersion == currentVersion {
            return false
        }else{
            userDefault.set(currentVersion, forKey: "app_version")
            userDefault.synchronize()
            return true
        }
    }
    static var version: String {
        let infoDic = Bundle.main.infoDictionary
        return (infoDic?["CFBundleShortVersionString"] as? String) ?? "0.0"
    }
}
