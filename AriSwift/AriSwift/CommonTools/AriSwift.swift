//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  AriSwift.swift 
//  AriSwift 
// 
//  Created by Ari on 2018/8/31. 
//  Copyright © 2018年 AriSwift. All rights reserved. 	
// 

import Foundation
import UIKit
public struct AriSwift<Base> {
    public let base: Base
    public init(_ base: Base) {self.base = base}
}

public protocol AriSwiftCompatible {
    associatedtype CompatibleType
    static var `as`: AriSwift<CompatibleType>.Type { get set }
    var `as`: AriSwift<CompatibleType> { get set }
}

public extension AriSwiftCompatible {
    static var `as`: AriSwift<Self>.Type {
        get {return AriSwift<Self>.self}
        set {}
    }
    var `as`: AriSwift<Self> {
        get {return AriSwift(self)}
        set {}
    }
}
extension NSObject: AriSwiftCompatible {}

