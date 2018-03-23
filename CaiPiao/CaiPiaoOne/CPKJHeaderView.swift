//
//  CPKJHeaderView.swift
//  CaiPiao-One
//
//  Created by kevinlu on 2018/2/9.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit
import SnapKit

class CPKJHeaderView: UIView {
    @IBOutlet weak var serialLabel:UILabel?
    @IBOutlet weak var contentView:UIView?
    var kaijiangNum : String? {
        didSet{
            let nums = kaijiangNum?.components(separatedBy: "#") as! [String]
            let firstNums = nums[0].components(separatedBy: ",")
            let secondsNums = nums.count > 1 ? nums[1].components(separatedBy: ","):[]
            NSLog("\(firstNums) - \(secondsNums)")
            var lastLabel :UILabel?
            for item in firstNums {
                let numLabel = UILabel()
                numLabel.text = item
                numLabel.textAlignment = .center
                numLabel.layer.cornerRadius = 15
                numLabel.layer.masksToBounds = true
                numLabel.layer.borderColor = UIColor(red: 224/255.0, green: 0, blue: 0, alpha: 1).cgColor
                numLabel.layer.borderWidth = 1
                numLabel.textColor = UIColor(red: 224/255.0, green: 0, blue: 0, alpha: 1)
                self.addSubview(numLabel)
                numLabel.snp.makeConstraints({ (make) in
                    if let _ = lastLabel {
                        make.left.equalTo(lastLabel!.snp.right).offset(10)
                    }else{
                        make.left.equalTo(self.contentView!).offset(10)
                    }
                    make.size.equalTo(CGSize(width:30,height:30))
                    make.centerY.equalTo(self.contentView!)
                })
                lastLabel = numLabel
            }
            for item in secondsNums {
                let numLabel = UILabel()
                numLabel.text = item
                numLabel.textAlignment = .center
                numLabel.layer.cornerRadius = 15
                numLabel.layer.masksToBounds = true
                numLabel.layer.borderColor = UIColor(red: 1/255.0, green: 180/255.0, blue: 225/255.0, alpha: 1).cgColor
                numLabel.layer.borderWidth = 1
                numLabel.textColor = UIColor(red: 1/255.0, green: 180/255.0, blue: 225/255.0, alpha: 1)
                
                self.addSubview(numLabel)
                numLabel.snp.makeConstraints({ (make) in
                    if let _ = lastLabel {
                        make.left.equalTo(lastLabel!.snp.right).offset(10)
                    }else{
                        make.left.equalTo(self.contentView!).offset(10)
                    }
                    make.size.equalTo(CGSize(width:30,height:30))
                    make.centerY.equalTo(self.contentView!)
                })
                lastLabel = numLabel
            }
            
            
        }
    }

}
