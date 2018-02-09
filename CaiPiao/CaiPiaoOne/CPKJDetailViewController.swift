//
//  CPKJDetailViewController.swift
//  CaiPiao-One
//
//  Created by kevinlu on 2018/2/9.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.serialLabel?.text = "17期"
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cpkjCell", for: indexPath)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
