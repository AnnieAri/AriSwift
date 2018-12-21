//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  NibLoadable.swift 
//  XHZSwift 
// 
//  Created by Ari on 2018/11/19. 
//  Copyright © 2018 AriSwift. All rights reserved. 	
// 

import UIKit
public protocol NibLoadable {
}

public extension NibLoadable where Self : UIView {
    static func loadFromNib(_ nibname : String? = nil) -> Self {
        let loadName = nibname == nil ? "\(self)" : nibname!
        let bundle = Bundle(for: self.classForCoder())
        let view = bundle.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
        view.autoresizingMask = []
        return view
    }
}
extension UIView: NibLoadable {}

