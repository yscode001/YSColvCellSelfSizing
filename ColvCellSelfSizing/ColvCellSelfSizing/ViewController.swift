//
//  ViewController.swift
//  ColvCellSelfSizing
//
//  Created by 姚帅 on 2019/3/7.
//  Copyright © 2019 chat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var titles:[String] = {
        return ["哈哈","哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈","哈哈哈哈",
                "哈哈","哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈","哈哈哈哈",
                "哈哈","哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈","哈哈哈哈",
                "哈哈","哈哈哈哈哈哈","哈哈哈哈哈哈哈哈哈哈","哈哈哈哈"]
    }()

    private lazy var colV:UICollectionView = {
        let v = UICollectionView(frame: self.view.bounds, collectionViewLayout: FlowLayout_colv())
        v.backgroundColor = UIColor.white
        v.dataSource = self
        v.delegate = self
        v.register(Cell_colv.self, forCellWithReuseIdentifier: "id")
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(colV)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colV.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as! Cell_colv
        cell.setupData(title: titles[indexPath.item])
        return cell
    }
}
