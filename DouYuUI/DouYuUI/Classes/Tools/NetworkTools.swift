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
            guard let results = resp.value else {
                print(resp.error?.errorDescription ?? "请求失败~~~")
                return
            }
            finishedCallBack(results)
        }
    }
}
