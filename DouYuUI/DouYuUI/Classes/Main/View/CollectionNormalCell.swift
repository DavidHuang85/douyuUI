//
//  CollectionNormalCell.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/10.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionNormalCell: UICollectionViewCell {
    // MARK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subtitleLable: UILabel!
    
    // MARK:- 模型属性
    var anchor : AnchorModel? {
        didSet {
            guard let anchor = self.anchor else { return }
            
            var str : String = ""
            if anchor.online > 10000 {
                str = "\(Int(anchor.online / 10000))万在线"
            } else {
                str = "\(anchor.online)在线"
            }
            
            onlineBtn.setTitle(str, for: .normal)
            
            titleLable.text = anchor.nickname
            subtitleLable.text = anchor.room_name
            
            guard let url = URL(string: anchor.vertical_src) else { return }
            iconImageView.kf.setImage(with: url)
        }
    }
    

}
