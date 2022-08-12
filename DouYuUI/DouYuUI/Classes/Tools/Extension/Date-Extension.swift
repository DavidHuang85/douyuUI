//
//  Date-Extension.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/11.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit
extension Date {
    static func getCurrentDate() -> String {
        let now = Int(Date.timeIntervalSinceReferenceDate)
        return "\(now)"
    }
}
