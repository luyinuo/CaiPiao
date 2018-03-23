//
//  CPZiXunTableViewCell.swift
//  CaiPiao-One
//
//  Created by kevinlu on 2018/3/23.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit

class CPZiXunTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var model:CPZiXunModel? {
        didSet {
            titleLabel.text = model?.title
            fromLabel.text = model?.pubaddr
            dateLabel.text = model?.pubdate
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
