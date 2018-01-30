//
//  UITableView+Extension.swift
//  MicroVote
//
//  Created by Chen on 2017/6/21.
//  Copyright © 2017年 YFY. All rights reserved.
//

import UIKit
import SnapKit



extension UITableView {
    
    // 改进写法【推荐】
    struct RuntimeKey {
        static let emptyLabKey = UnsafeRawPointer.init(bitPattern: "EMPTYLABLE".hashValue)
        static let emptyStrKey = UnsafeRawPointer.init(bitPattern: "EMPTYSTRING".hashValue)
        /// ...其他Key声明
    }
    
    
    fileprivate var emptyLable: UILabel? {
        set {
            objc_setAssociatedObject(self, UITableView.RuntimeKey.emptyLabKey!, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return  objc_getAssociatedObject(self, UITableView.RuntimeKey.emptyLabKey!) as? UILabel
        }
    }
    
    var emptyString: String? {
        set {
            objc_setAssociatedObject(self, UITableView.RuntimeKey.emptyStrKey!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, UITableView.RuntimeKey.emptyStrKey!) as? String ?? "暂无数据"
        }
    }
    
    
    func addEmptyView(models:[Any]?) {
        if models?.isEmpty == false{
            self.emptyLable?.removeFromSuperview()
            self.emptyLable = nil
            return
        }
        
        
        if self.emptyLable == nil {
            self.emptyLable = UILabel()
            self.emptyLable?.textColor = UIColor.black
            self.emptyLable?.font = UIFont.systemFont(ofSize: 15.0)
            self.addSubview(self.emptyLable!)
            
            self.emptyLable!.snp.makeConstraints { (make) in
                make.centerX.centerY.equalTo(self)
            }
        }
        
        self.emptyLable!.text = self.emptyString
    }
    
}
