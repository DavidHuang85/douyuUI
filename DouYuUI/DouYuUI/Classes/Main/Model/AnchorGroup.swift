//
//  AnchorGroup.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/11.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit

class AnchorGroup: BaseModel {
    //定义主播的房间列表
    var anchorList : [AnchorModel] {
        get {
            return room_list
        }
    }
    
    //组中的房间
    var room_list : [AnchorModel] = [AnchorModel]()
    
    //组的标题
    var tag_name : String = ""
    //组的icon
    var small_icon_url : String  = "home_header_phone"
    //组的icon
    var icon_url : String  = "home_header_phone"
}
