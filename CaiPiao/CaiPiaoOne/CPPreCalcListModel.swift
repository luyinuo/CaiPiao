//
//  CPPreCalcListModel.swift
//  CaiPiao-One
//
//  Created by kevinlu on 2018/1/30.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import HandyJSON

class CPPreCalcListModel: CPBaseModel {
    var list: [CPPreCalcModel] = []
}
/*
 "calcid": "17404432",
 "username": "秘密杀号",
 "isexpert": "1",
 "hitnum": "测5期对5期",
 "priceleve": "3",
 "status": 1,
 "userid": "53214",
 "playname": "杀三码",
 "playtype": "1039",
 "award": "杀3对3",
 "calc": "05,25,31",
 "viewnum": 1,
 "nextsid": "17455948",
 "nextplayname": "杀三码",
 "nextplaytype": "1039",
 "nextcalc": "该预测需要 3 金币才能查看，你确定需要查看此预测吗？",
 "nextpriceleve": "3",
 "nextstatus": 1,
 "nextplaydes": null
 */
struct CPPreCalcModel: HandyJSON {
    var calcid:Int = 0
    var username:String = ""
    var isexpert:Int = 0
    var hitnum:String = ""
    var priceleve:Int = 0
    var status:Int = 0
    var userid:Int = 0
    var playname:String = ""
    var playtype:Int = 0
    var award:String = ""
    
}
