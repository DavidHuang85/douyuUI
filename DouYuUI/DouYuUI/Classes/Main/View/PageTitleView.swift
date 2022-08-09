//
//  PageTitleView.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/9.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit

private let kScrollLineH : CGFloat = 2

class PageTitleView: UIView {
    
    // MARK:- 定义属性
    private var titles : [String]
    private var lables : [UILabel] = [UILabel]()
    private var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.scrollsToTop = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        }
        
        return scrollView
    }()
    
    private var scrollMenu : UIView = {
        let menu = UIView()
        menu.backgroundColor = .orange
        return menu
        
    }()
    
    
    

    
    // MARK:- 构造函数
    init(frame: CGRect, titles : [String]) {
        self.titles = titles
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageTitleView {
    // MARK:- 设置UI
    private func setupUI() {
        //添加ScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //添加 titles 所对应的 lables
        setupTitleLables()
        
        //添加底部滑块 和 底部的线
        setupBottomLineAndScrollLine()
    }
    
    private func setupTitleLables () {
        
        let lableW : CGFloat = bounds.width / CGFloat(titles.count)
        let lableH : CGFloat = bounds.height - kScrollLineH
        let lableY : CGFloat = 0
        
        for (index,title) in titles.enumerated() {
            let lable = UILabel()
            lable.text = title
            lable.tag = index
            lable.font = .systemFont(ofSize: 18)
            lable.textColor = .darkGray
            lable.textAlignment = .center
            
            let lableX : CGFloat = lableW * CGFloat(index)
            
            lable.frame = CGRect(x: lableX, y: lableY, width: lableW, height: lableH)
            scrollView.addSubview(lable)
            lables.append(lable)
            
            if index == 0 {
                lable.textColor = .orange
            }
        }
    }
    
    private func setupBottomLineAndScrollLine () {
        //添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = .lightGray
        bottomLine.frame = CGRect(x: 0, y: frame.height - kScrollLineH, width: frame.width, height: kScrollLineH)
        addSubview(bottomLine)
        
        
        
        guard let firstLable = lables.first else {return}
        
        addSubview(scrollMenu)
        scrollMenu.frame = CGRect(x: firstLable.frame.origin.x, y: frame.height - kScrollLineH, width: firstLable.bounds.width, height: kScrollLineH)
    }
}
