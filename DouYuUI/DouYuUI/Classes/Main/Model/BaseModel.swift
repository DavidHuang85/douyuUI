//
//  BaseModel.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/15.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit
import HandyJSON


//MARK: - JSon解析模型的基类
class BaseModel: HandyJSON {
    var error : Int = -1
    var data : [[String : NSObject]]?
    //MARK: - 使用 HandyJSON 进行解析
    required init() {}
}
