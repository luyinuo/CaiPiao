//
//  NewsDetailViewController.swift
//  CaiPiao-One
//
//  Created by lyn on 2018/2/6.
//  Copyright © 2018年 otvcloud. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    var newsId:String = ""
    var urlStr:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        var url = ""
        if !newsId.isEmpty {
            url = "https://h5.jdd.com/communal/news/detail?id=\(newsId)"//100058326
        }
        if !urlStr.isEmpty {
            url = urlStr
        }
        
        let request = NSURLRequest(url:URL(string:url)!)
        self.webView.delegate = self
        self.webView.loadRequest(request as URLRequest)
    }

    @IBAction func clickReturnBtn(_ sender: UIButton) {
        if let _ = self.navigationController {
            self.navigationController?.popViewController(animated: true)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
//        self.showLoading()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
//        self.hiddenLoading()
    }
}
