//
//  AnchorGroup.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/11.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit

class AnchorGroup: NSObject {
    //定义主播的房间列表
    lazy var anchorList : [AnchorModel] = [AnchorModel]()
    
    //组中的房间
    @objc var room_list : [[String : NSObject]]? {
        // MARK:- 方式二 解析 room_list
        didSet {
            guard let roomList = room_list else { return }
            for dict in roomList {
                let anchor = AnchorModel(dict: dict)
                anchorList.append(anchor)
            }
        }
    }
    
    //组的标题
    @objc var tag_name : String = ""
    //组的icon
    @objc var small_icon_url : String  = ""
    //组的icon
    @objc var icon_url : String  = ""
    
    init(dic : [String : NSObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    // MARK:- 处理不需要的字段 否则就crash了
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    
    // MARK:- kvc方法解析 room_list 字段 方法一
//    override func setValue(_ value: Any?, forKey key: String) {
//        if key == "room_list" {
//            if let data = value as? [[String : NSObject]] {
//                for dict in data {
//                    let anchor = AnchorModel(dict: dict)
//                    anchorList.append(anchor)
//                }
//            }
//        } else {
//            super.setValue(value, forKey: key)
//        }
//    }
}
