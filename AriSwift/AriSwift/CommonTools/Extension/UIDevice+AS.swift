//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  UIDevice+AS.swift 
//  AriSwift 
// 
//  Created by Ari on 2018/10/8. 
//  Copyright © 2018年 AriSwift. All rights reserved. 	
//

import UIKit
public enum DeviceType: String {
    case unknown
    case iPhone4
    case iPhone4S
    case iPhone5
    case iPhone5c
    case iPhone5S
    case iPhone6
    case iPhone6Plus
    case iPhone6S
    case iPhone6SPlus
    case iPhoneSE
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    case iPhoneXR
    case iPhoneXS
    case iPhoneXMax
    case simulator
}
public extension AriSwift where Base: UIDevice {
    static var deviceTypeName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let mirror = Mirror(reflecting: systemInfo.machine)
        let type = mirror.children.map {String(UnicodeScalar(UInt8( $0.value as! Int8)))}.joined()
        return type
    }
    static var deviceType: DeviceType {
        switch deviceTypeName {
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return .iPhone4
        case "iPhone4,1":                               return .iPhone4S
        case "iPhone5,1", "iPhone5,2":                  return .iPhone5
        case "iPhone5,3", "iPhone5,4":                  return .iPhone5c
        case "iPhone6,1", "iPhone6,2":                  return .iPhone5S
        case "iPhone7,2":                               return .iPhone6
        case "iPhone7,1":                               return .iPhone6Plus
        case "iPhone8,1":                               return .iPhone6S
        case "iPhone8,2":                               return .iPhone6SPlus
        case "iPhone8,4":                               return .iPhoneSE
        case "iPhone9,1", "iPhone9,3":                  return .iPhone7
        case "iPhone9,2", "iPhone9,4":                  return .iPhone7Plus
        case "iPhone10,1", "iPhone10,4":                return .iPhone8
        case "iPhone10,2", "iPhone10,5":                return .iPhone8Plus
        case "iPhone10,3", "iPhone10,6":                return .iPhoneX
        case "iPhone11,8":                              return .iPhoneXR
        case "iPhone11,2":                              return .iPhoneXS
        case "iPhone11,6":                              return .iPhoneXMax
        case "x86_64":                                  return .simulator
        default:                                        return .unknown
        }
    }
    static var ipAddress: String {
        var addresses = [String]()
        var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while (ptr != nil) {
                let flags = Int32(ptr!.pointee.ifa_flags)
                var addr = ptr!.pointee.ifa_addr.pointee
                if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                    if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        if (getnameinfo(&addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                            if let address = String(validatingUTF8:hostname) {
                                addresses.append(address)
                            }
                        }
                    }
                }
                ptr = ptr!.pointee.ifa_next
            }
            freeifaddrs(ifaddr)
        }
        return addresses.first ?? "0.0.0.0"
    }
    static var deviceBrands: String {return "Apple"}
    static var systemVersion: String {return Base.current.systemVersion}
}
