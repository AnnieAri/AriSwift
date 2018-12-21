//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  FileManager+AS.swift 
//  AriSwift 
// 
//  Created by Ari on 2018/9/10. 
//  Copyright © 2018年 AriSwift. All rights reserved. 	
// 

import Foundation
public extension AriSwift where Base: FileManager {
    /// 沙盒目录路径
    public static var homeDirectory: String {
        return NSHomeDirectory()
    }
    
    /// 沙盒temp路径
    public static var tempDirectory: String {
        return NSTemporaryDirectory()
    }
    
    /// 沙盒documents路径
    public static var documentsDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    /// 沙盒library路径
    public static var libraryDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
    }
    
    /// 沙盒cache路径
    public static var cacheDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    }
}
