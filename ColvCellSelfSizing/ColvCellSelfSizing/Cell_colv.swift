//
//  Cell_colv.swift
//  ColvCellSelfSizing
//
//  Created by 姚帅 on 2019/3/7.
//  Copyright © 2019 chat. All rights reserved.
//

import UIKit

class Cell_colv: UICollectionViewCell {
    
    private lazy var btn:UIButton = {
        let v = UIButton()
        v.setTitleColor(UIColor.black, for: .normal)
        v.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        v.backgroundColor = UIColor.lightGray
        v.layer.cornerRadius = 18
        v.layer.masksToBounds = true
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraint(NSLayoutConstraint(item: btn, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: btn, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: btn, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 15))
        contentView.addConstraint(NSLayoutConstraint(item: btn, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -15))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(title: String){
        btn.setTitle(title, for: .normal)
    }
    
    // 关键代码：重写此方法，返回最新frame
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let att = super.preferredLayoutAttributesFitting(layoutAttributes)
        let string:NSString = (btn.title(for: .normal) ?? "") as NSString
        var newFram = string.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: btn.bounds.size.height), options: .usesLineFragmentOrigin, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)
            ], context: nil)
        newFram.size.height = 36
        newFram.size.width += 60
        att.frame = newFram
        return att
    }
}
