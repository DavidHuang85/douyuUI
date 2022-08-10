//
//  RecommendViewController.swift
//  DouYuUI
//
//  Created by davidhuang on 2022/8/10.
//  Copyright © 2022 davidhuang. All rights reserved.
//

import UIKit

// MARK:- 常量定义
private let kItemMargin : CGFloat = 10
private let kItemW : CGFloat = (kScreenW - 3 * kItemMargin) / 2
private let kItemH : CGFloat = kItemW * 3 / 4
private let kHeadViewH : CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kHeadViewID = "kHeadViewID"



// MARK:- 类的定义
class RecommendViewController: UIViewController {
    
    
    // MARK:- 定义属性
    private lazy var collectionView : UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeadViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        
        
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader , withReuseIdentifier: kHeadViewID)
        
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight];
        
        
        return collectionView
    } ()

    
    // MARK:- 系统回调方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置UI
        setupUI()
    }
    
}

extension RecommendViewController {
    // MARK:- 设置UI
    private func setupUI() {
        //添加CollectionView
        view.addSubview(collectionView)
    }
}

extension RecommendViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath)
        
        cell.contentView.backgroundColor = UIColor.RandomColor()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeadViewID, for: indexPath)
        headView.backgroundColor = UIColor.RandomColor()
        return headView
    }
    
    
}
