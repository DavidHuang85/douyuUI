//
//  CollectionHeaderView.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/10.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionHeaderView: UICollectionReusableView {
    
    
    // MARK:- 控件属性
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    // MARK:- 模型属性
    var group : AnchorGroup? {
        didSet {
            titleLable.text = group?.tag_name
            let imageName = group?.small_icon_url ?? ""
            
            if imageName.hasPrefix("http") {
                if let url = URL(string: imageName) {
                    iconImageView.kf.setImage(with: url)
                }
            } else {
                iconImageView.image = UIImage(named: imageName)
            }
        }
    }
}
