//
//  PageContentView.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/9.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit

private let kcollectionCellID = "kcollectionCellID"

class PageContentView: UIView {
    
    private var childVcs:[UIViewController]
    private weak var parentVc:UIViewController?
    
    
    private lazy var collectionView: UICollectionView = { [weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self!.bounds.size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        
        collectionView.dataSource = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kcollectionCellID)
        
        
        return collectionView
    }()
    
    init(frame: CGRect,chileVcs:[UIViewController],parentVc:UIViewController) {
        self.childVcs = chileVcs
        self.parentVc = parentVc
        
        super.init(frame: frame)
        
        
        //设置UI
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageContentView {
    // MARK:- 设置UI
    private func setupUI() {
        
        
        guard let parentVc = parentVc else { return}
        //添加子控制器
        for childvc in childVcs {
            parentVc.addChild(childvc)
        }
        
        //添加UICollectionView
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

// MARK:- 遵循UICollectionViewDataSource的协议
extension PageContentView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kcollectionCellID, for: indexPath)
        
        //给cell设置内容
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        } 
        
        let childVc = childVcs[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

// MARK:- 对外暴露的公共方法
extension PageContentView {
    func setupCurrentIndex(currentIndex : Int) {
        let offsetX = collectionView.frame.width * CGFloat(currentIndex)
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated:false)
    }
}
