//
//  MVHudLoadingExtension.swift
//  MicroVote
//
//  Created by Chen on 2017/6/19.
//  Copyright © 2017年 YFY. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    ///HUD
    func showLoading() ->(){
        JJHUD.showLoading()
    }
    
    func showMessage(message:String) ->(){
        JJHUD.showText(text: message, delay: 2.0)
    }
    func hiddenLoading() ->(){
        JJHUD.hide()
    }
}

extension UIView{
    ///HUD
    func showLoading() ->(){
        JJHUD.showLoading()
    }
    
    func showMessage(message:String) ->(){
        JJHUD.showText(text: message, delay: 2.0)
    }
    
    func hiddenLoading() ->(){
        JJHUD.hide()
    }
}
