import UIKit

class FlowLayout_colv: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        guard let colV = collectionView else{
            return
        }
        scrollDirection = .vertical
        minimumInteritemSpacing = 8
        minimumLineSpacing = 16
        
        // 预估itemSize
        estimatedItemSize = CGSize(width: (colV.bounds.width - 8 * 2) / 3, height: 36)
    }
    
    // 向左对齐：正向遍历
    /*
     override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
     guard let attrsArry = super.layoutAttributesForElements(in: rect) else {
     return nil
     }
     if attrsArry.count < 2{
     return attrsArry
     } else{
     for i in 0..<attrsArry.count {
     if i < attrsArry.count - 1 {
     let curAttr = attrsArry[i] // 当前attr
     let nextAttr = attrsArry[i + 1]  // 下一个attr
     if curAttr.frame.minY == nextAttr.frame.minY { // 如果下一个在同一行则调整，不在同一行则跳过
     if nextAttr.frame.minX - curAttr.frame.maxX > minimumInteritemSpacing{
     nextAttr.frame.origin.x = curAttr.frame.maxX + minimumInteritemSpacing
     }
     }
     }
     }
     return attrsArry
     }
     }
     */
    
    // 向右对齐：倒序遍历
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let colV = collectionView else {
            return nil
        }
        guard let attrsArry = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        if attrsArry.count == 0{
            return attrsArry
        } else if attrsArry.count == 1{
            let curAttr = attrsArry[0]
            curAttr.frame.origin.x = colV.bounds.width - curAttr.frame.width
            return attrsArry
        } else{
            for i in 0..<attrsArry.count {
                let j = attrsArry.count - 1 - i
                let curAttr = attrsArry[j]
                if j == attrsArry.count - 1{ // 最后一个向右对齐
                    curAttr.frame.origin.x = colV.bounds.width - curAttr.frame.width
                } else{
                    let nextAttr = attrsArry[j + 1]
                    if curAttr.frame.minY == nextAttr.frame.minY { // 如果下一个在同一行则调整
                        if nextAttr.frame.minX - curAttr.frame.maxX > minimumInteritemSpacing{
                            curAttr.frame.origin.x = nextAttr.frame.minX - minimumInteritemSpacing - curAttr.frame.width
                        }
                    } else{ // 如果下一个不在同一行，则当前的向右对齐
                        curAttr.frame.origin.x = colV.bounds.width - curAttr.frame.width
                    }
                }
            }
            return attrsArry
        }
    }
}
