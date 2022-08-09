//
//  PageTitleView.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/9.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit

class PageTitleView: UIView {
    
    //MARK - 定义属性
    var titles : [String]

    
    //MARK - 构造函数
    init(frame: CGRect, titles : [String]) {
        self.titles = titles
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
