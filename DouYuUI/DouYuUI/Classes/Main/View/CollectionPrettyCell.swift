//
//  CollectionPrettyCell.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/11.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionPrettyCell: UICollectionViewCell {
// MARK:- 控件属性
    @IBOutlet weak var iconImageV: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nickNameLable: UILabel!
    
    @IBOutlet weak var cityLable: UILabel!
    // MARK:- 模型属性
    var anchor : AnchorModel? {
        didSet {
            guard let anchor = self.anchor else { return }
            nickNameLable.text = anchor.nickname
            cityLable.text = anchor.anchor_city
            
            var str = ""
            if anchor.online > 10000 {
                str = "\(Int(anchor.online / 10000))万在线"
            } else {
                str = "\(anchor.online)在线"
            }
            
            onlineBtn.setTitle(str, for: .normal)
            
            guard let url = URL(string: anchor.vertical_src) else { return }
            
            iconImageV.kf.setImage(with: url)
            
        }
    }
    
}
