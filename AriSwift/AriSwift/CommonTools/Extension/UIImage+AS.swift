//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  UIImage+AS.swift 
//  AriSwift 
// 
//  Created by Ari on 2018/9/10. 
//  Copyright © 2018年 AriSwift. All rights reserved. 	
// 

import Foundation
import UIKit
public extension AriSwift where Base: UIImage {
    //获取屏幕截图的图片
    public func getScreenSnap() -> UIImage?{
        //获取到window
        let window = UIApplication.shared.keyWindow
        return  window?.as.getViewSnap()
    }
    
    //缩放到指定宽度
    public func scale(to width: CGFloat) -> UIImage{
        if base.size.width < width {
            return base
        }
        let height = base.size.height * (width / base.size.width)
        
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        //开启上下文
        UIGraphicsBeginImageContext(rect.size)
        //会将当前图片的所有内容完整的画到上下文中
        base.draw(in: rect)
        let result = UIGraphicsGetImageFromCurrentImageContext()!
        //关闭上下文
        UIGraphicsEndImageContext()
        return result
    }
    
    /// 生成指定颜色背景的图片
    ///
    /// - Parameters:
    ///   - color:
    ///   - size:
    /// - Returns: image
    public func image(with color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
