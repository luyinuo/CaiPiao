//
//  NSDate+Extension.swift
//  MicroVote
//
//  Created by Chen on 2017/6/21.
//  Copyright © 2017年 YFY. All rights reserved.
//

import Foundation

extension NSDate {

    func getCurrentTimesTamp() -> Int{
        return Int(NSDate().timeIntervalSince1970)
    }
    
}
