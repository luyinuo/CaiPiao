//
//  CPZiXunListModel.swift
//  CaiPiao-One
//
//  Created by kevinlu on 2018/3/23.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit
import HandyJSON
class CPZiXunListModel: CPBaseModel {
    var list: [CPZiXunModel] = []
}
/*
 "title": "营口200位彩民合买 喜中双色球二等奖",
 "pubdate": "2018-03-22",
 "pubaddr": "中彩网",
 "url": "http://115.29.175.83/cpyc/zjinfo/1001_16266442.html"
 */
struct CPZiXunModel: HandyJSON {
    var title: String = ""
    var pubdate: String = ""
    var pubaddr: String = ""
    var url: String = ""
}
