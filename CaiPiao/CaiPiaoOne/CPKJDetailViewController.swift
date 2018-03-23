//
//  CPKJDetailViewController.swift
//  CaiPiao-One
//
//  Created by kevinlu on 2018/2/9.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit
import Moya
/**
 双色球：
 http://115.29.175.83/cpyc/getprecalc.php?lastid=-1&playtype=1039&lottype=1001&issuenum=30
 playtype=1039,1040
 福彩3D:
 http://115.29.175.83/cpyc/getprecalc.php?lastid=-1&playtype=1038&lottype=1002&issuenum=30
 七乐彩：
 http://115.29.175.83/cpyc/getprecalc.php?lastid=-1&playtype=1039&lottype=1003&issuenum=30
 */
class CPKJDetailViewController: UITableViewController {
    @IBOutlet weak var headerView: CPKJHeaderView!
    var playtype: Int!
    var lottype: Int!
    var resultModel:CPPreCalcListModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        fetchData(playtype: playtype, lottype: lottype)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultModel?.list.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cpkjCell", for: indexPath) as! CPKJTableViewCell
        let model = self.resultModel?.list[indexPath.row]
        cell.model = model
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension CPKJDetailViewController {
    public func fetchData(playtype:Int,lottype:Int) {
        let provider = MoyaProvider<MVHttpService>()
        provider.request(.getPrecalc(playtype: playtype, lottype: lottype)) { (result) in
            switch result {
            case let .success(response):
                do {
                    let filtResponse = try response.filterSuccessfulStatusCodes()
                    
                    let resultModel = filtResponse.mapModel(CPPreCalcListModel.self)
                    self.resultModel = resultModel
                    self.headerView.kaijiangNum = self.resultModel?.kjnum
                    self.headerView.serialLabel?.text = "\(self.resultModel?.kjissue ?? "")期"
                    self.tableView.reloadData()
//                    NSLog("\(result.list)")
                }catch{
                    debugPrint("request error")
                }
            case let .failure(error):
                print("请求失败"+error.localizedDescription)
            }
        }
    }
}
