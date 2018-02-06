//
//  TGCollectionView.swift
//  MicroVote
//
//  Created by kevinlu on 2017/5/19.
//  Copyright © 2017年 YFY. All rights reserved.
//

import UIKit

class TGCollectionView: UICollectionView {

    let screenWith = UIScreen.main.bounds.size.width
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let result = point.x.truncatingRemainder(dividingBy: screenWith)
        if result < 20 && point.x > self.contentOffset.x{
            return nil
        }else {
            return super.hitTest(point, with: event)
        }
    }

}
