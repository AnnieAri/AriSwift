//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  GitHub: https://github.com/AnnieAri
//  Date+AS.swift 
//  AriSwift 
// 
//  Created by AriSwift on 2019/1/9. 
//  Copyright © 2019 AriSwift. All rights reserved. 	
// 

import Foundation
fileprivate let calender = Calendar(identifier: .gregorian)
extension Date: AriSwiftCompatible {}
public extension AriSwift where Base == Date {
    ///生成date  默认formatter "yyyy-MM-dd HH:mm:ss"
    static func date(from dateStr: String?, fmt: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
//        Date()
        guard let dateStr = dateStr else {return nil}
        let dateFmt = DateFormatter()
        dateFmt.dateFormat = fmt
        return dateFmt.date(from: dateStr)
    }
    /// 默认formatter "yyyy-MM-dd HH:mm:ss"
    func dateString(with fmt: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFmt = DateFormatter()
        dateFmt.dateFormat = fmt
        return dateFmt.string(from: base)
    }
    
    
    var year: Int {
        return calender.component(.year, from: base)
    }
    var month: Int {
        return calender.component(.month, from: base)
    }
    var day: Int {
        return calender.component(.day, from: base)
    }
    var hour: Int {
        return calender.component(.hour, from: base)
    }
    var minute: Int {
        return calender.component(.minute, from: base)
    }
    var second: Int {
        return calender.component(.second, from: base)
    }
    var weekDay: Int {
        return calender.component(.weekday, from: base)
    }
}
