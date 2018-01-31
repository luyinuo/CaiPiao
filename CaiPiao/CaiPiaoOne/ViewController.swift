//
//  ViewController.swift
//  CaiPiao
//
//  Created by kevinlu on 2018/1/29.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit
import Moya
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("\(SERVER_URL)")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        var headerViewHeight:CGFloat = 0.0
        if(UIDevice.current.userInterfaceIdiom == .pad) {
            headerViewHeight = kScreenW / 5.0 * 2 + 10
        }else{
            headerViewHeight = kScreenW / 3.0 * 3 + 10
        }
        self.tableView.tableHeaderView?.height = headerViewHeight;
        self.fetchNews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentify", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
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
    func fetchNews (){
        
        let path = Bundle.main.path(forResource:"news", ofType: "json")
        
        let url = URL(fileURLWithPath: path!)
        
        do{
            
            let data = try Data(contentsOf: url)
            
            let json:Any = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers)
            
            let datalist = json as! NSArray
            print(datalist)//输出数据
            
        }catch let erro as Error!{
            
            print("读取本地数据出现错误！",erro)
            
        }
    }
}
