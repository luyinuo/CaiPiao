//
//  CPBaseModel.swift
//  CaiPiao-One
//
//  Created by kevinlu on 2018/1/30.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit
import HandyJSON
/*
 errorcode": 0,
 "secttime": 0,
 "message": "欢迎来围观专家预测比赛，新注册用户赠送8金币，确定注册吗？",
 "lottype": "1001",
 "kjissue": "2018012",
 "kjnum": "11,12,13,19,26,28#12",
 "nextissue": "2018013",
 "lastid": "17409587",
 "hasnextpage": 0,
 */
class CPBaseModel: HandyJSON {
    var errorcode = 0
    var message = ""
    var lottype = 0
    var lastid = 0
    required init(){}
}
