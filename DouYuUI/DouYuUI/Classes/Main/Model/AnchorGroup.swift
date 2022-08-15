//
//  AnchorGroup.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/11.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit
import HandyJSON

class AnchorGroup: HandyJSON {
    //定义主播的房间列表
    var anchorList : [AnchorModel]  {
        get {
            return room_list
        }
    }
    
    //组中的房间
    lazy var room_list : [AnchorModel] = [AnchorModel]()
//    {
//        // MARK:- 方式二 解析 room_list
//        didSet {
//            anchorList.removeAll()
//            guard let roomList = room_list else { return }
//            for dict in roomList {
//                guard let anchor = AnchorModel.deserialize(from: dict) else { continue }
//                anchorList.append(anchor)
//            }
//        }
//    }
    
    //组的标题
    var tag_name : String = "热门"
    //组的icon
    var small_icon_url : String  = "home_header_phone"
    //组的icon
    var icon_url : String  = "home_header_phone"
    
    //使用 HandyJSON 进行解析
    required init() {}
}
