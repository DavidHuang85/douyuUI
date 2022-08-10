//
//  UIDevice-Extension.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/10.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit
extension UIDevice {
    // MARK:- 顶部安全区域高度
    class func devSafeDistanceTop() -> CGFloat {
        if #available(iOS 11.0, *) {
            let safeArea = UIApplication.shared.keyWindow?.safeAreaInsets
            return safeArea?.top ?? 0
        }
        return 0
    }
    
    
    // MARK:- 底部安全距离
    class func devSafeBottomMargin() -> CGFloat {
        var safeBottom:CGFloat = 0
        if #available(iOS 11, *) {
            let safeArea = UIApplication.shared.keyWindow?.safeAreaInsets
            safeBottom = safeArea?.bottom ?? 0
        }
        return safeBottom
    }
    
    // MARK:- tabBar 高度
    class func devSystemTabBarHeigh() -> CGFloat {
        return 49
    }
}
