//
//  ViewController.swift
//  CaiPiao
//
//  Created by kevinlu on 2018/1/29.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit
import KRProgressHUD
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var newsDataList:NSMutableArray = NSMutableArray()
    var tempView: UIView!
    let dataSource = [[1001,1039,"双色球"],[1002,1038,"福彩3D"],[1003,1039,"七乐彩"],[1004,1055,"七星彩"],[1005,1038,"排列三"],[1006,1050,"排列五"],[1007,1039,"大乐透"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        tempView = UIView()
        tempView.backgroundColor = UIColor.white
        tempView.frame = self.view.bounds
        UIApplication.shared.keyWindow?.addSubview(tempView)
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
        self.tableView.register(UINib.init(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        self.tableView.tableFooterView = UIView()
        self.fetchNews()
        self.showHud()
        self.loadBmobData()
    }
    func loadBmobData() {
        let query = BmobQuery(className: "config")
        query?.whereKey("identifyID", equalTo: "caipiaoyucedashi")
        query?.findObjectsInBackground({ (result, error) in
            
            for dic in (result)! {
                NSLog("\(dic)")
                let data = (dic as! BmobObject)
                let show = data .object(forKey: "show") as! Bool
                let url = data.object(forKey: "addurl") as! String
                
                if(show == true){
                    let webVC = CPWebViewController()
                    webVC.urlStr = url
                    self.present(webVC, animated: false)
                }
                
            }
            self.hideHud()
        })
    }
    
    @IBAction func clickBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "detailIdentify", sender: sender)
    }
    
    @IBAction func gotoNews(_ sender: Any) {
        let zixunVC = ZiXunViewController()
        zixunVC.title = "最新资讯"
        self.navigationController?.pushViewController(zixunVC, animated: true)
    }
    @IBAction func gotoTrend(_ sender: Any) {
        let trendVc = CPTrendTableViewController()
        self.navigationController?.pushViewController(trendVc, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let btn = sender as! UIView
        let destinationVC = segue.destination as! CPKJDetailViewController
        destinationVC.lottype = (self.dataSource[btn.tag] as [Any]) [0] as! Int
        destinationVC.playtype = (self.dataSource[btn.tag] as [Any]) [1] as! Int
        destinationVC.title = (self.dataSource[btn.tag] as [Any]) [2] as? String
        super.prepare(for: segue, sender: sender)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsDataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.model = self.newsDataList[indexPath.row] as? CPNewsModel
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let newsDetailVC = NewsDetailViewController()
        newsDetailVC.newsId = (self.newsDataList[indexPath.row] as! CPNewsModel).id
        self.present(newsDetailVC, animated: true)
//        UIView.transition(from: self.view, to: newsDetailVC.view, duration: 0.25, options: UIViewAnimationOptions.transitionFlipFromLeft) { (bol) in
//
//        }

        
    }
}

extension ViewController {
    
    func fetchNews (){
        
        let path = Bundle.main.path(forResource:"news", ofType: "json")
        
        let url = URL(fileURLWithPath: path!)
        let dataArray:NSMutableArray = NSMutableArray()
        do{
            
            let data = try Data(contentsOf: url)
            
            let json:Any = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers)
            
            let datalist = json as! NSArray
            for dic in datalist {
                if let news = CPNewsModel.deserialize(from: dic as? Dictionary) {
                    dataArray.add(news)
                }
                
            }
            print(datalist)//输出数据
            self.newsDataList = dataArray;
        }catch let erro as Error!{
            
            print("读取本地数据出现错误！",erro)
            
        }
    }
    func showHud(){
        KRProgressHUD
            .set(style: .custom(background: .clear, text: .black, icon: nil))
            .set(maskType: .black)
            .show()
        let label = UILabel()
        label.text = "正在加载中..."
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        self.tempView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.tempView).offset(8)
            make.centerY.equalTo(self.tempView).offset(60)
        }
    }
    func hideHud(){
        KRProgressHUD.dismiss()
        self.tempView.isHidden = true
    }
}
