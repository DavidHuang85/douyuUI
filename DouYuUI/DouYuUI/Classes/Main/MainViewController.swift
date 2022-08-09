//
//  MainViewController.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/9.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


extension MainViewController {
    
    fileprivate func setupUI() {
//        addChildVc(storyName: "Home")
//        addChildVc(storyName: "Live")
//        addChildVc(storyName: "Follow")
//        addChildVc(storyName: "Profile")
    }
    
    
    fileprivate func addChildVc(storyName: String) {
        let chileVC = UIStoryboard(name:storyName, bundle: nil).instantiateInitialViewController()!
        addChild(chileVC)
    }
}
