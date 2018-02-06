//
//  CPNewsModel.swift
//  CaiPiao-One
//
//  Created by lyn on 2018/2/1.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit
import HandyJSON
/*
 "combatGainsDesc": "5中2",
 "contentType": 0,
 "createTime": "今日 11:46",
 "id": 100058060,
 "imgUrl": "http://fdfs.jdd.com/group1/M00/07/FA/rBACD1pxO4WAf5cqAAAV9825Nuw316.jpg",
 "infoType": 5,
 "isIndex": true,
 "isJump": true,
 "isTop": false,
 "label": "",
 "readCount": 1318,
 "replyCount": 0,
 "shortTime": "2018-01-31 11:46:28",
 "showType": null,
 "sort": 0,
 "source": "球妹看球",
 "sourceUserId": "球妹看球",
 "title": "[球妹看球]球妹每日红单资讯：红魔远征难拔“刺” 里斯本竞技力擒弱旅",
 "userWeight": 0,
 "weight": 0
 */
struct CPNewsModel: HandyJSON {
    var title:String = ""
    var imgUrl:String = ""
    var source:String = ""
    var id:String = ""
    var createTime:String = ""
    var readCount:String = ""
}
