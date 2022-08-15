//
//  AnchorModel.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/11.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit


class AnchorModel : BaseModel {
    //房间号
    var room_id : String = ""
    //房间图片
    var vertical_src : String = ""
    
    //手机直播 还是 电脑直播  0-电脑直播 1-手机直播
    var isVertical : Int  = 0
    
    //房间名称
    var room_name : String = ""
    
    //主播的昵称
    var nickname : String = ""
    
    //在线人数
    var online : Int  = 0
    
    //所在城市
    var anchor_city : String = ""
}
