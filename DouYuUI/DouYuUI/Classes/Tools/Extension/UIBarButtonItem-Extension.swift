//
//  UIBarButtonItem-Extension.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/9.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit
extension UIBarButtonItem {
    //方法一 类方法
    class func createItem(imageName : String,highImageName : String,size : CGSize) -> UIBarButtonItem {

        let historyBtn = UIButton()
        historyBtn.setImage(UIImage(named:imageName), for: .normal)
        historyBtn.setImage(UIImage(named:highImageName), for: .highlighted)

        historyBtn.frame = CGRect(origin: .zero, size: size)
        return UIBarButtonItem(customView: historyBtn)
    }
    
    
    //方法二 便利构造器
    convenience init(imageName : String,highImageName : String = "",size : CGSize = .zero) {
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named:highImageName), for: .highlighted)
        }
        
        if size == .zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: .zero, size: size)
        }
        
        self.init(customView:btn)
    }
}
