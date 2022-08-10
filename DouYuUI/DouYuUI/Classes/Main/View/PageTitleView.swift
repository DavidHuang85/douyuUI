//
//  PageTitleView.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/9.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit

// MARK:- 设置常量
private let kScrollLineH : CGFloat = 2
private let kNormalColor : (CGFloat,CGFloat,CGFloat) = (85,85,85)
private let kSelectColor : (CGFloat,CGFloat,CGFloat) = (255,128,0)

// MARK:- 定义协议
protocol PageTitleViewDelegate : class {
    func pageTitleView(titleView : PageTitleView , selectedInex index : Int)
}

// MARK:- 定义类
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
            lable.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
            lable.textAlignment = .center
            
            let lableX : CGFloat = lableW * CGFloat(index)
            
            lable.frame = CGRect(x: lableX, y: lableY, width: lableW, height: lableH)
            scrollView.addSubview(lable)
            titleLables.append(lable)
            
            if index == 0 {
                lable.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
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
        //获取当前点击的 lable
        guard let currentLable = (tapGes.view as? UILabel) else { return }
        
        if currentLable.tag == currentIndex {
            print("点击了相同的Lable")
            return
        }
        
        
        //处理新旧lable 的文字颜色
        let oldLable = titleLables[currentIndex]
        oldLable.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
        currentLable.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        
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

// MARK:- 对外暴露的公开方法
extension PageTitleView {
    func setTileWithProgress(progress : CGFloat , sourceIndex : Int, targetIndex : Int){
        
        let sourceLable = titleLables[sourceIndex]
        let targetLable = titleLables[targetIndex]
        
        
        //处理滑块的渐变
        let moveTotalX = targetLable.frame.origin.x - sourceLable.frame.origin.x
        let moveX = moveTotalX * progress
        scrollMenu.frame.origin.x = sourceLable.frame.origin.x + moveX
        
        //处理颜色的渐变
        let colorDeltaTotal = (kSelectColor.0 - kNormalColor.0,kSelectColor.1 - kNormalColor.1,kSelectColor.2 - kNormalColor.2)
        
        let colorDetal = (colorDeltaTotal.0 * progress, colorDeltaTotal.1 * progress,colorDeltaTotal.2 * progress)
        
        
        sourceLable.textColor = UIColor(r: kSelectColor.0 - colorDetal.0, g:  kSelectColor.1 - colorDetal.1, b:  kSelectColor.2 - colorDetal.2)
        
        targetLable.textColor = UIColor(r: kNormalColor.0 + colorDetal.0, g: kNormalColor.1 + colorDetal.1, b: kNormalColor.2 + colorDetal.2)
        
        currentIndex = targetIndex
    }
}
