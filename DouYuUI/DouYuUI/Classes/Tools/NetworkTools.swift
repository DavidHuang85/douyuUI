//
//  NetworkTools.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/11.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class NetworkTools{
    class func requestData(method : MethodType,URLString : String,parameters : [String : String]? = nil,finishedCallBack : @escaping (_ reuslt : Any)->()) {
        let method = method == .GET ? HTTPMethod.get : HTTPMethod.post
        AF.request(URLString, method: method, parameters:parameters).responseJSON { (resp : AFDataResponse<Any>) in
            switch resp.result {
            case .success(let json):
//                print("json的值是：")
//                print(json)
                
//                let baseData = BaseModel.deserialize(from: json)
                
                
                guard let obj = BaseModel.deserialize(from: json as? Dictionary) else {
                    print("服务器返回数据可能有问题 数据是：\(json)")
                    return
                }
                print("请求地址是：\(resp.request?.url?.absoluteString ?? "")")
                print("error------>\(obj.error)")
                
                
                guard let results = resp.value else {
                    print(resp.error?.errorDescription ?? "请求失败~~~")
                    return
                }
                finishedCallBack(results)
            case .failure(let error):
                print("网络请求出错了,错误信息如下：")
                print(error)
            }
            
            
        }
    }
}
