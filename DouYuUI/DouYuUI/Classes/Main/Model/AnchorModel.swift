//
//  AnchorModel.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/11.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    //房间号
    @objc var room_id : String? = ""
    //房间图片
    @objc var vertical_src : String? = ""
    
    //手机直播 还是 电脑直播  0-电脑直播 1-手机直播
    @objc var isVertical : Int  = 0
    
    //房间名称
    @objc var room_name : String? = ""
    
    //主播的昵称
    @objc var nickname : String? = ""
    
    //在线人数
    @objc var online : Int  = 0
    
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
