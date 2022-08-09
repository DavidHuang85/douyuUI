//
//  HomeViewController.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/9.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置UI
        setupUI()
    }
}

extension HomeViewController {
    //设置UI
    private func setupUI () {
//        navigationItem.title = "首页"
        //设置首页导航栏
        setupNavigationBar()
    }
    
    private func setupNavigationBar () {
        
        //导航栏左侧
        let btn = UIButton()
        btn.setImage(UIImage(named:"logo"), for: .normal)
        btn.sizeToFit()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        
        //导航栏右侧
        let size = CGSize(width: 40, height: 40)
        
        let historyBtn = UIButton()
        historyBtn.setImage(UIImage(named: "image_my_history"), for: .normal)
        historyBtn.setImage(UIImage(named:"Image_my_history_click"), for: .highlighted)

        historyBtn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        let historyItem = UIBarButtonItem(customView: historyBtn)
        
        
        let searchBtn = UIButton()
        searchBtn.setImage(UIImage(named: "btn_search"), for: .normal)
        searchBtn.setImage(UIImage(named:"btn_search_click"), for: .highlighted)
        searchBtn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        let searchitem = UIBarButtonItem(customView: searchBtn)
        
        
        let qrcodeBtn = UIButton()
        qrcodeBtn.setImage(UIImage(named: "Image_scan"), for: .normal)
        qrcodeBtn.setImage(UIImage(named:"Image_scan_click"), for: .highlighted)
        qrcodeBtn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        let qrcodeItem = UIBarButtonItem(customView: qrcodeBtn)
        
        navigationItem.rightBarButtonItems = [historyItem,searchitem,qrcodeItem];
    }
}


