//
//  AnchorGroup.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/11.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit
import HandyJSON

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
    
    
    //MARK: - 字段映射
    
//    func mapping(mapper: HelpingMapper) {
//        // 指定 id 字段用 "cat_id" 去解析
//        mapper.specify(property: &id, name: "cat_id")
//
//        // 指定 parent 字段用这个方法去解析
//        mapper.specify(property: &parent) { (rawString) -> (String, String) in
//            let parentNames = rawString.characters.split{$0 == "/"}.map(String.init)
//            return (parentNames[0], parentNames[1])
//        }
//    }
}
