//
//  HomeViewController.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/9.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


private let kPageTitleViewH : CGFloat = 70

class HomeViewController: UIViewController {
    
    // MARK:-  懒加载属性
    private lazy var pageTitleView : PageTitleView = { [weak self] in
        let titleFrame : CGRect = CGRect(x: 0, y: kStatusH + kNavigationBarH, width: kScreenW, height: kPageTitleViewH)
        let titles  = ["推荐","游戏","娱乐","趣玩"]
        let pageTitleView = PageTitleView(frame: titleFrame, titles: titles);
        
        
        pageTitleView.delegate = self
        
        return pageTitleView
    }()
    
    private lazy var pageContentView : PageContentView = { [weak self] in
        
        //设置pageContentView的高度
        let pageContentViewH = kScreenH - (kNavigationBarH + kStatusH + kPageTitleViewH) - UIDevice.devSystemTabBarHeigh() - UIDevice.devSafeBottomMargin()
        var arrVC : [UIViewController] = [UIViewController]()
        
        //添加推荐VC
        let recommendVc = RecommendViewController()
        arrVC.append(recommendVc)
        
        for _ in 0..<3 {
            let vc = UIViewController()
             
            arrVC.append(vc)
        } 
        
        let view = PageContentView(frame: CGRect(x: 0, y: kNavigationBarH + kStatusH + kPageTitleViewH, width:kScreenW, height: pageContentViewH), chileVcs: arrVC, parentVc: self!)
        
        view.backgroundColor = UIColor.RandomColor()
        view.delegate = self
        return view
        
    } ()
    
    
    
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置UI
        setupUI()
        
        // MARK:- test function
        myTest()
    }
}

extension HomeViewController {
    
    // MARK:- myTest
    private func myTest() {
        
        // MARK:- for test hjl
        
        //        testDeviceInfo()
//        testAlamofireImage()
        
    }
    
    private func testDeviceInfo () {
        print("****相关测试数据 开始****")
        print("当前设备的名称 UIDevice.current.model是:\(UIDevice.current.model)")
        
        print("当前设备的名称 UIDevice.current.systemName是:\(UIDevice.current.systemName)")
        
        print("当前设备的顶部安全区域高度 UIDevice.devSafeDistanceTop()是:\(UIDevice.devSafeDistanceTop())")
        
        print("当前设备的底部部安全区域高度 UIDevice.devSafeBottomMargin()是:\(UIDevice.devSafeBottomMargin())")
        
        print("当前设备的tabBar高度 UIDevice.devSystemTabBarHeigh()是:\(UIDevice.devSystemTabBarHeigh())")
        print("====相关测试数据 结束====")
    }
    
    private func testAlamofireImage () {
        
        //        let url = URL(string: "https://httpbin.org/image/png")
        
        //        AF.request().responseImage { (response : AFDataResponse<Image>) in
        //            debugPrint(response)
        //        }
        
        AF.request("https://httpbin.org/image/png").responseImage { (response : AFDataResponse<Image>) in
            
            debugPrint("response 是:")
            debugPrint(response)
            
            
//            print(response.request)
//            print(response.response)
            debugPrint(response.result)
            
            print("**********")
        }
        
    }
    
    // 设置UI
    private func setupUI () {
        
        //0 不需要调整 scrollView的内边距
        
        if #available(iOS 11.0, *) {
            //            scrollView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        
        
        //设置首页导航栏
        setupNavigationBar()
        
        // MARK:- 添加pageTitleView
        view.addSubview(pageTitleView)
        
        // MARK:- 添加pageContentView
        view.addSubview(pageContentView)
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

// MARK:- 遵循PageTitleViewDelegate协议
extension HomeViewController : PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectedInex index: Int) {
        pageContentView.setupCurrentIndex(currentIndex: index)
    }
}

// MARK:- 遵循PageContentViewDelegate协议
extension HomeViewController : PageContentViewDelegate {
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        
        pageTitleView.setTileWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
