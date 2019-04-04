
//
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  GitHub: https://github.com/AnnieAri
//  String+AS.swift 
//  AriSwift 
// 
//  Created by AriSwift on 2019/1/9. 
//  Copyright © 2019 AriSwift. All rights reserved. 	
// 

import Foundation
public extension AriSwift where Base == String {
    ///从一个时间格式转换成另一种时间格式
    func changeDateFormatter(from fmt1: String, to fmt2: String) -> String {
        let dateFmt1 = DateFormatter()
        dateFmt1.dateFormat = fmt1
        let dateFmt2 = DateFormatter()
        dateFmt2.dateFormat = fmt2
        
        guard let date = dateFmt1.date(from: base) else {
            return ""
        }
        return dateFmt2.string(from: date)
        
    }
    func size(with font: UIFont, maxSize: CGSize) -> CGSize {
        return (base as NSString).boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [.font:font], context: nil).size
    }
    
    ///传入时间(秒)返回字符串格式
    ///```
    ///e.g.  180 -> "03:00"
    ///```
    static func formatTime(with seconds: Int) -> String {
        let hour = seconds / 3600
        let minut = (seconds % 3600)/60
        let second = seconds % 60
        if hour == 0 {
            return String(format: "%02zd:%02zd", minut,second)
        }else{
            return String(format: "%zd:%02zd:%02zd",hour,minut,second)
        }
    }
}
