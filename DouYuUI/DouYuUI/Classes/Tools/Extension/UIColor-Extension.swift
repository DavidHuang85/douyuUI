//
//  UIColor-Extension.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/9.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit

extension UIColor {
    //构造函数
    convenience init(r: CGFloat,g: CGFloat,b: CGFloat) {
        self.init(red:r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    
    // MARK:- UIColor的类方法
    class func RandomColor()-> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
    }
}

