//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  UIColor+AS.swift 
//  AriSwift 
// 
//  Created by Ari on 2018/9/10. 
//  Copyright © 2018年 AriSwift. All rights reserved. 	
// 

import Foundation
import UIKit
public extension AriSwift where Base: UIColor {
    /// 获取随机色
    public static var random: UIColor {
        return UIColor(red: UInt8(arc4random_uniform(256)), green: UInt8(arc4random_uniform(256)), blue: UInt8(arc4random_uniform(256)))
    }
}
public extension UIColor {
    ///rgba快速构建
    public convenience init(red r: UInt8, green g:UInt8, blue b: UInt8, alpha a: CGFloat = 1) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }
    ///hexCollor快速构建
    public convenience init(_ hex: UInt32,alpha: CGFloat = 1 ) {
        let r = UInt8((hex & 0xFF0000) >> 16)
        let g = UInt8((hex & 0x00FF00) >> 8)
        let b = UInt8(hex & 0x0000FF)
        
        self.init(red: r, green: g, blue: b,alpha: alpha)
    }
}
