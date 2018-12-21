//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  UIView+AS_Layer.swift 
//  AriSwift 
// 
//  Created by Ari on 2018/9/10. 
//  Copyright © 2018年 AriSwift. All rights reserved. 	
// 

import UIKit
public extension AriSwift where Base: UIView {
    
    var cornerRadius: CGFloat {
        get {
            return base.layer.cornerRadius
        }
        set {
            base.layer.cornerRadius = newValue
            base.layer.masksToBounds = newValue > 0
        }
    }
    
     var borderWidth: CGFloat {
        get {
            return base.layer.borderWidth
        }
        set {
            base.layer.borderWidth = newValue
        }
    }
    
    var borderColor: UIColor? {
        get {
            return UIColor(cgColor: base.layer.borderColor!)
        }
        set {
            base.layer.borderColor = newValue?.cgColor
        }
    }
}
public extension UIView {
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    public var corner: Bool {
        get {
            return cornerRadius > 0
        }
        set {
            if newValue {
                cornerRadius = 5
            } else {
                cornerRadius = 0
            }
        }
    }
}
