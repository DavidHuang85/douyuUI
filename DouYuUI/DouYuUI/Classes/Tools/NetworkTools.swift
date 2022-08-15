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
            case .success(_):
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
