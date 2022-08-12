//
//  RecommendViewModel.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/11.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit

class RecommendViewModel {
    // MARK:- 懒加载属性
    private lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
}

extension RecommendViewModel {
    func requestData() {
        let url = "http://capi.douyucdn.cn/api/v1/getHotCate"
        NetworkTools.requestData(method:.GET, URLString: url,parameters: ["limit": "4","offset":"0","time":Date.getCurrentDate()]) { (result : Any) in
//            print("post 获取到的数据是")
//            print(result)
            //将result 转成 字典类型
            guard let resultDict = result as? [String : NSObject] else {
                print("将result 转成 字典类型 失败")
                return
            }
            
            guard let dataArr = resultDict["data"] as? [[String : NSObject]] else {
               print("将resultDict[\"data\"] 转成 数组模型 失败")
               return
            }
            
            for dict in dataArr {
                let anchorG = AnchorGroup(dic: dict)
                self.anchorGroups.append(anchorG)
            }
            
            for group in self.anchorGroups {
                print(group.tag_name)
            }
        }
    }
}
