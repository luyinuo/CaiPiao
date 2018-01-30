//
//  ViewController.swift
//  CaiPiao
//
//  Created by kevinlu on 2018/1/29.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit
import Moya
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("\(SERVER_URL)")
        self.fetchData(playtype: 1039, lottype: 1001, success: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension UIViewController {
    func fetchData(playtype:Int,lottype:Int,success:(()->())?) {
        let provider = MoyaProvider<MVHttpService>()
        provider.request(.getPrecalc(playtype: 1039, lottype: 1001)) { (result) in
            switch result {
            case let .success(response):
                do {
                    let filtResponse = try response.filterSuccessfulStatusCodes()
                    
                    let result = filtResponse.mapModel(CPPreCalcListModel.self)
                    NSLog("\(result.list)")
                }catch{
                    debugPrint("request error")
                }
            case let .failure(error):
                print("请求失败"+error.localizedDescription)
            }
        }
    }
}
