//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  UIViewController+Alert.swift 
//  Alamofire 
// 
//  Created by POPLAR on 2018/12/12. 
//   	
// 

import UIKit
public enum ToastPosition {
    case center
    case bottom
}
public extension AriSwift where Base : UIViewController {
    
    
    /// 系统样式alertController 无按键 默认2s后消失
    ///
    /// - Parameters:
    ///   - message: 提示信息
    ///   - delay: 消失延时 默认2s
    ///   - completion: 消失完成回掉
    func showAlert(with message: String,delay: Double = 2,completion: (() -> Void)? = nil ){
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        base.present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.base.dismiss(animated: true, completion: completion)
        }
    }
    
   
    /// 类似于Android Toast样式 默认2秒后消失
    ///
    /// - Parameters:
    ///   - message: 提示信息
    ///   - delay: 消失延时 默认2s
    ///   - position: 位置 中间或者底部
    ///   - completion: 消失完成回掉
    func showToast(with message: String?, delay: Double = 2,position: ToastPosition = .center ,completion: (() -> Void)? = nil){
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = message
//        label.preferredMaxLayoutWidth = UIScreen.as.width * 0.7
      
        label.frame = CGRect(x: 0, y: 0, width: UIScreen.as.width * 0.7, height: UILabel.as.calculateLabelHeight(with: message ?? ""))
        
//        label.sizeToFit()
        var bgView = UIView(frame: CGRect(x: 0, y: 0, width: label.bounds.width+20, height: label.bounds.height+20))
        bgView.as.cornerRadius = 10
        bgView.backgroundColor = UIColor.init(white: 0, alpha: 0.7)
        bgView.addSubview(label)
        label.center = CGPoint(x: bgView.as.width/2, y: bgView.as.height/2)
        bgView.center = CGPoint(x: UIScreen.as.width/2, y: UIScreen.as.height/2)
        if position == .bottom {
            bgView.as.y = UIScreen.as.height - 100
        }
        bgView.alpha = 0
        UIApplication.shared.keyWindow?.addSubview(bgView)
        UIView.animate(withDuration: 0.25, animations: {
            bgView.alpha = 1
        }) { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                UIView.animate(withDuration: 0.25, animations: {
                    bgView.alpha = 0
                }) { _ in
                    bgView.removeFromSuperview()
                }
            })
        }
    }
    
}
