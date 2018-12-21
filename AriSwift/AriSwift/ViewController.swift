//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  ViewController.swift 
//  AriSwift 
// 
//  Created by Ari on 2018/8/31. 
//  Copyright © 2018年 AriSwift. All rights reserved. 	
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imgView = UIImageView(image: UIImage(named: "navigationbar_back_withtext"))
        view.addSubview(imgView)
//        #imageLiteral(resourceName: "tab_mine_selected")
    }
    
    func testAS_Frame() {
        let v = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        ///200
        print(v.as.height)
        ///200
        
    }
}

