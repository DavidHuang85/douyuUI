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
    
    //MARK - 设置UI
    private func setupUI () {
        //设置首页导航栏
        setupNavigationBar()
    }
    

    
    private func setupNavigationBar () {
        //导航栏左侧
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        //导航栏右侧
        let size = CGSize(width: 40, height: 40)
        
        /*
         //方法一 类方法
        let historyItem = UIBarButtonItem.createItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchitem = UIBarButtonItem.createItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem.createItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        */
        
        
        //方法二 便利构造器
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchitem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)

        
        
        navigationItem.rightBarButtonItems = [historyItem,searchitem,qrcodeItem];
    }
    
    
}


