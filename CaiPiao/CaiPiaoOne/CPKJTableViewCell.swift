//
//  CPKJTableViewCell.swift
//  CaiPiao-One
//
//  Created by kevinlu on 2018/2/9.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit

class CPKJTableViewCell: UITableViewCell {
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var roleLabel:UILabel!
    @IBOutlet weak var serialLabel:UILabel!
    @IBOutlet weak var centerView:UIView!
    @IBOutlet weak var readCountLabel: UILabel!
    @IBOutlet weak var calcLable: UILabel!
    var model:CPPreCalcModel? {
        didSet {
            name.text = model?.username
            roleLabel.text = "专家"
            serialLabel.text = model?.hitnum
            readCountLabel.text = "\(model?.viewnum ?? 0)"
            let calcs = model?.calc.components(separatedBy: ",") ?? []
            var calcStr = ""
            for num in calcs {
                calcStr.append(" \(num)")
            }
            calcLable.text = calcStr
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
