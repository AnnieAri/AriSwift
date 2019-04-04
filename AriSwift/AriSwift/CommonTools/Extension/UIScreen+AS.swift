//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  UIScreen+AS.swift 
//  AriSwift 
// 
//  Created by Ari on 2018/9/10. 
//  Copyright © 2018年 AriSwift. All rights reserved. 	
// 

import Foundation
import UIKit
public extension AriSwift where Base: UIScreen {
    public static var width: CGFloat {return UIScreen.main.bounds.width}
    public static var height: CGFloat {return UIScreen.main.bounds.height}
    /// 4 4s
    public static var is4s: Bool {
        return UIScreen.main.currentMode?.size == CGSize(width: 640, height: 960)
    }
    /// 5 5s 5c se
    public static var is5: Bool {
        return UIScreen.main.currentMode?.size == CGSize(width: 640, height: 1136)
    }
    /// 6 6s 7 8
    public static var is6: Bool {
        return UIScreen.main.currentMode?.size == CGSize(width: 750, height: 1334)
    }
    /// 6p 6sp 7p 8p
    public static var is6plus: Bool {
        return UIScreen.main.currentMode?.size == CGSize(width: 1242, height: 2208)
    }
    /// x xs
    public static var isX: Bool {
        return UIScreen.main.currentMode?.size == CGSize(width: 1125, height: 2436)
    }
    /// xr
    public static var isXR: Bool {
        return UIScreen.main.currentMode?.size == CGSize(width: 828, height: 1792)
    }
    /// xsmax
    public static var isXMax: Bool {
        return UIScreen.main.currentMode?.size == CGSize(width: 1242, height: 2688)
    }
    
    /// statusBar height
    public static var statusBarHeight: CGFloat {
        return (isX || isXR || isXMax) ? 30 : 20
    }
    /// navBar heihgt
    public static var navBarHeight: CGFloat {
        return (isX || isXR || isXMax) ? 88 : 64
    }
    /// tabBar heihgt
    public static var tabBarHeight: CGFloat {
        return (isX || isXR || isXMax) ? 83 : 49
    }
    
}
