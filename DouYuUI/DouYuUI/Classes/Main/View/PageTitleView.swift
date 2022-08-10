//
//  PageTitleView.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/9.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit

private let kScrollLineH : CGFloat = 2

// MARK:- PageTitleViewDelegate 代理方法
protocol PageTitleViewDelegate : class {
    func pageTitleView(titleView : PageTitleView , selectedInex index : Int)
}

class PageTitleView: UIView {
    // MARK:- 定义属性
    //点击lable事件的代理对象
    weak var delegate : PageTitleViewDelegate?
    
    //当前选择lable的下标
    private var currentIndex = 0
    
    private var titles : [String]
    private var titleLables : [UILabel] = [UILabel]()
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
    
    //构造函数
    init(frame: CGRect, titles : [String]) {
        self.titles = titles
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- 设置UI
extension PageTitleView {
    
    private func setupUI() {
        //添加ScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //添加 titles 所对应的 titleLables
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
            titleLables.append(lable)
            
            if index == 0 {
                lable.textColor = .orange
            }
            
            
            lable.isUserInteractionEnabled = true
            let lableGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLableClick(_:)))
            lable.addGestureRecognizer(lableGes)
        }
    }
    
    private func setupBottomLineAndScrollLine () {
        //添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = .lightGray
        bottomLine.frame = CGRect(x: 0, y: frame.height - kScrollLineH, width: frame.width, height: kScrollLineH)
        addSubview(bottomLine)
        
        
        
        guard let firstLable = titleLables.first else {return}
        
        addSubview(scrollMenu)
        scrollMenu.frame = CGRect(x: firstLable.frame.origin.x, y: frame.height - kScrollLineH, width: firstLable.bounds.width, height: kScrollLineH)
    }
}

// MARK:- lable的点击事件
extension PageTitleView {
    @objc private func titleLableClick(_ tapGes : UITapGestureRecognizer) {
        print("====")
        
        //获取当前点击的 lable
        guard let currentLable = (tapGes.view as? UILabel) else { return }
        
        if currentLable.tag == currentIndex {
            print("点击了相同的Lable")
            return
        }
        
        
        //处理新旧lable 的文字颜色
        let oldLable = titleLables[currentIndex]
        oldLable.textColor = .darkGray
        currentLable.textColor = .orange
        
        currentIndex = currentLable.tag
        
        //处理滑块的位置
        let scrollLineX = CGFloat(currentLable.tag) * scrollMenu.frame.width
        UIView.animate(withDuration: 0.25) {
            self.scrollMenu.frame.origin.x = scrollLineX
        }
        
        //将点击的相关参数传递出去
        delegate?.pageTitleView(titleView: self, selectedInex: currentIndex)
    }
}
