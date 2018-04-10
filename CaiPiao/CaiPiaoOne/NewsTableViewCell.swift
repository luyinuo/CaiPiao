//
//  NewsTableViewCell.swift
//  CaiPiao-One
//
//  Created by lyn on 2018/2/6.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit
import Kingfisher
class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var readCount: UILabel!
    @IBOutlet weak var author: UILabel!
    /*
    var model:CPNewsModel? {
        didSet {
            let iconUrl = URL(string:model?.imgUrl ?? "")!
            hoverImageView.kf.setImage(with: ImageResource.init(downloadURL: iconUrl))
            titleLabel.text = model?.title
            author.text = model?.source
            readCount.text = "阅读\(model?.readCount ?? "")"
        }
    }*/
    var model:CPZiXunModel? {
        didSet {
            titleLabel.text = model?.title
            author.text = model?.pubaddr
            readCount.text = model?.pubdate
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.separatorInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        // Initialization code
    }
//    func setModel(_ model:CPNewsModel) {
//        self.model = model
//        self.titleLabel.text = model.title
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
