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
private let kNormalItemH : CGFloat = kItemW * 3 / 4
private let kPrettyItemH : CGFloat = kItemW * 4 / 3
private let kHeadViewH : CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kPrettyCellID = "kPrettyCellID"
private let kHeadViewID = "kHeadViewID"



// MARK:- 类的定义
class RecommendViewController: UIViewController {
    // MARK:- 定义属性
    
    private lazy var recommendVM : RecommendViewModel = RecommendViewModel()
    private lazy var collectionView : UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kNormalItemH)
        layout.minimumLineSpacing = kItemMargin
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeadViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        
        collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeadViewID)
        
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight];
        
        
        return collectionView
    } ()

    
    // MARK:- 系统回调方法
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置UI
        setupUI()
        
        //请求数据
        loadData()
    }
    
}

extension RecommendViewController {
    // 设置UI
    private func setupUI() {
        //添加CollectionView
        view.addSubview(collectionView)
    }
    
    // 请求数据
    private func loadData() {
        recommendVM.requestData {
            self.collectionView.reloadData()
        }
    }
}

// MARK:- 遵循UICollectionViewDataSource 和 UICollectionViewDelegateFlowLayout 协议
extension RecommendViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommendVM.anchorGroups.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let group = self.recommendVM.anchorGroups[section]
        return group.anchorList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
            
            let group = self.recommendVM.anchorGroups[indexPath.section]
            cell1.anchor = group.anchorList[indexPath.row]
            return cell1
        }
        
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
        
        let group = self.recommendVM.anchorGroups[indexPath.section]
        cell2.anchor = group.anchorList[indexPath.row]
        
        return cell2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeadViewID, for: indexPath) as! CollectionHeaderView
        headView.group = self.recommendVM.anchorGroups[indexPath.section]
        
        return headView
    }
    
    //不同UICollectionViewCell的 CGSize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
        
            return CGSize(width: kItemW, height: kPrettyItemH)
        }
        return CGSize(width: kItemW, height: kNormalItemH)
    }
}
