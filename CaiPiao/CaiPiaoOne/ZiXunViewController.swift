//
//  ZiXunViewController.swift
//  CaiPiao-One
//
//  Created by kevinlu on 2018/3/23.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit
import Moya

class ZiXunViewController: UITableViewController {
    var listModel:CPZiXunListModel?
    let lottypeArray = [1001,1002,1003,1004,1005,1007]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: "CPZiXunTableViewCell", bundle: nil), forCellReuseIdentifier: "CPZiXunTableViewCell")
        self.tableView.tableFooterView = UIView()
        fetchData(lottype: lottypeArray[0])
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModel?.list.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CPZiXunTableViewCell", for: indexPath) as! CPZiXunTableViewCell
        let model = self.listModel?.list[indexPath.row]
        cell.model = model
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 81
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let model = self.listModel?.list[indexPath.row]
        let newsDetailVC = NewsDetailViewController()
        newsDetailVC.urlStr = model?.url ?? ""
        self.navigationController?.pushViewController(newsDetailVC, animated: true)
    }

}
extension ZiXunViewController {
    public func fetchData(lottype:Int) {
        let provider = MoyaProvider<MVHttpService>()
        provider.request(.getZiXun(lottype: lottype)) { (result) in
            switch result {
            case let .success(response):
                do {
                    let filtResponse = try response.filterSuccessfulStatusCodes()
                    
                    let resultModel = filtResponse.mapModel(CPZiXunListModel.self)
                    self.listModel = resultModel
                    
                    self.tableView.reloadData()
                }catch{
                    debugPrint("request error")
                }
            case let .failure(error):
                print("请求失败"+error.localizedDescription)
            }
        }
    }
}
