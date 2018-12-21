//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  UIView+AS_Frame.swift
//  AriSwift 
// 
//  Created by Ari on 2018/9/10. 
//  Copyright © 2018年 AriSwift. All rights reserved. 	
// 

import UIKit
public extension AriSwift where Base: UIView {
    public var x: CGFloat {
        get{
            return self.base.frame.origin.x
        }
        set{
            var rect = self.base.frame
            rect.origin.x = newValue
            self.base.frame = rect
        }
    }
    
    public var y: CGFloat {
        get{
            return self.base.frame.origin.y
        }
        set{
            var rect = self.base.frame
            rect.origin.y = newValue
            self.base.frame = rect
        }
    }
    
    public var width: CGFloat {
        get{
            return self.base.frame.size.width
        }
        set{
            var rect = self.base.frame
            rect.size.width = newValue
            self.base.frame = rect
        }
    }
    
    public var height: CGFloat {
        get{
            return self.base.frame.size.height
        }
        set{
            var rect = self.base.frame
            rect.size.height = newValue
            self.base.frame = rect
        }
    }
    
    public var size: CGSize {
        get{
            return self.base.frame.size
        }
        set{
            var rect = self.base.frame
            rect.size = newValue
            self.base.frame = rect
        }
    }
    
    public var centerX: CGFloat {
        get{
            return self.base.center.x
        }
        set{
            var point = self.base.center
            point.x = newValue
            self.base.center = point
        }
    }
    
    public var centerY: CGFloat {
        get{
            return self.base.center.y
        }
        set{
            var point = self.base.center
            point.y = newValue
            self.base.center = point
        }
    }
    
    public var bottom: CGFloat {
        return self.y + self.height
    }
    public var right: CGFloat {
        return self.x + self.width
    }
    ///当前view截屏
    func getViewSnap() -> UIImage?{
        //开启上下文
        UIGraphicsBeginImageContextWithOptions(base.bounds.size, false, 0)
        //将window的内容渲染到上下文中
        base.drawHierarchy(in: base.bounds, afterScreenUpdates: false)
        //取到上下文中的图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //关闭上下文
        UIGraphicsEndImageContext()
        //返回结果
        return image
    }
}
