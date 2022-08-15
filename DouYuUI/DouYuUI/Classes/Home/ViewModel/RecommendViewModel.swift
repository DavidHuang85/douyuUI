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
    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
    lazy var dispatchGroup : DispatchGroup = DispatchGroup()
}

extension RecommendViewModel {
    func requestData(finishedCallBack : @escaping () -> ()) {
        
        //定义参数
        let parameters =  ["limit": "4","offset":"0","time":Date.getCurrentDate()]
        //请求i第一部分数据
        self.dispatchGroup.enter()
        let url1 = "http://capi.douyucdn.cn/api/v1/getbigDataRoom"
        NetworkTools.requestData(method: .GET, URLString: url1, parameters: ["time": Date.getCurrentDate()]) { (result : Any) in
            
            guard let resultDict = result as? [String : NSObject] else {
                print("将result 转成 字典类型 失败")
                //                    dispatchG.leave()
                return
            }
            
            guard let dataArr = resultDict["data"] as? [[String : NSObject]] else {
                print("将resultDict[\"data\"] 转成 数组模型 失败")
                //                    dispatchG.leave()
                return
            }
            
            let tttt = ["tag_name" : "热门","small_icon_url":"home_header_hot","icon_url":"home_header_hot"]
            guard let group = AnchorGroup.deserialize(from: tttt) else { return }
            self.anchorGroups.append(group)
            
            for dict in dataArr {
                guard let anchor = AnchorModel.deserialize(from: dict) else { continue}
                group.room_list.append(anchor)
            }
            self.dispatchGroup.leave()
            
        }
        
        
        //请求第二部分数据 --- 颜值数据
        self.dispatchGroup.wait(timeout: .now() + 1)
        self.dispatchGroup.enter()
        let url2 = "http://capi.douyucdn.cn/api/v1/getverticalRoom"
        NetworkTools.requestData(method: .GET, URLString: url2, parameters: parameters) { (result : Any) in
            
            guard let resultDict = result as? [String : NSObject] else {
                print("将result 转成 字典类型 失败")
                //            dispatchG.leave()
                return
            }
            
            guard let dataArr = resultDict["data"] as? [[String : NSObject]] else {
                print("将resultDict[\"data\"] 转成 数组模型 失败")
                //            dispatchG.leave()
                return
            }
            
            let tttt = ["tag_name" : "颜值"]
            //           let group = AnchorGroup(dic: tttt as [String : NSObject])
            guard let group = AnchorGroup.deserialize(from: tttt) else { return }
            self.anchorGroups.append(group)
            
            for dict in dataArr {
                guard let anchor = AnchorModel.deserialize(from: dict) else { continue }
                group.room_list.append(anchor)
            }
            self.dispatchGroup.leave()
        }
        
        
        //3. 请求的是第三部分数据  --- 游戏推荐数据
        self.dispatchGroup.wait(timeout: .now() + 1)
        self.dispatchGroup.enter()
        let url3 = "http://capi.douyucdn.cn/api/v1/getHotCate"
        NetworkTools.requestData(method:.GET, URLString: url3,parameters:parameters) { (result : Any) in
            guard let resultDict = result as? [String : NSObject] else {
                print("将result 转成 字典类型 失败")
                //                dispatchG.leave()
                return
            }
            
            guard let dataArr = resultDict["data"] as? [[String : NSObject]] else {
                print("将resultDict[\"data\"] 转成 数组模型 失败")
                //                dispatchG.leave()
                return
            }
            
            for dict in dataArr {
                guard let anchorG = AnchorGroup.deserialize(from: dict) else { return }
                
                self.anchorGroups.append(anchorG)
            }
            self.dispatchGroup.leave()
        }
        
        self.dispatchGroup.notify(queue: .main) {
            //通知外部 更新数据
            finishedCallBack()
        }
        
    }
}
