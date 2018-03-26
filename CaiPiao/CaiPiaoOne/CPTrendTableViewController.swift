//
//  CPTrendTableViewController.swift
//  CaiPiao-One
//
//  Created by kevinlu on 2018/3/23.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit

class CPTrendTableViewController: UITableViewController {
    let dataSource = [["大乐透前区分布","http://115.29.175.83/cpyc/trend_dlt/qianqufb.html"],
                      ["大乐透前区012路","http://115.29.175.83/cpyc/trend_dlt/qianqu012lu.html"],
                      ["大乐透后区分布","http://115.29.175.83/cpyc/trend_dlt/houqufb.html"],
                      ["福彩3D直选分布","http://115.29.175.83/cpyc/trend_3d/zhixuanfb.html"],
                      ["福彩3D直选属性","http://115.29.175.83/cpyc/trend_3d/zhixuanshuxing.html"],
                      ["七乐彩号码分布","http://115.29.175.83/cpyc/trend_qlc/hqfb.html"],
                      ["七乐彩前区大小","http://115.29.175.83/cpyc/trend_qlc/hqdaxiao.html"],
                      ["排列三直选分布","http://115.29.175.83/cpyc/trend_pl3/zhixuanfb.html"],
                      ["排列三直选属性","http://115.29.175.83/cpyc/trend_pl3/zhixuanshuxing.html"],
                      ["大乐透前区分布","http://115.29.175.83/cpyc/trend_dlt/qianqufb.html"],
                      ["大乐透后区特征","http://115.29.175.83/cpyc/trend_dlt/houqutez.html"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cellIdentify")
        self.tableView.tableFooterView = UIView()
        self.title = "最新走势"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.dataSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentify", for: indexPath)
        cell.textLabel?.text = (self.dataSource[indexPath.row] as [String])[0]
        cell.textLabel?.textColor = UIColor.darkGray
        // Configure the cell...

        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVc = NewsDetailViewController()
        detailVc.urlStr = (self.dataSource[indexPath.row] as [String])[1]
        detailVc.title = (self.dataSource[indexPath.row] as [String])[0]
        self.navigationController?.pushViewController(detailVc, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
