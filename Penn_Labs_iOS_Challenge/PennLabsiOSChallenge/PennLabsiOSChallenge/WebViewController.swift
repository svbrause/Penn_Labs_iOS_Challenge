//
//  WebViewController.swift
//  PennLabsiOSChallenge
//
//  Created by Sam Brause on 9/20/19.
//  Copyright © 2019 Sam Brause. All rights reserved.
//

import Foundation
import WebKit

class WebViewController: UIViewController{
    @IBOutlet var webView: WKWebView!
    @IBOutlet weak var navitem: UINavigationItem!
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
            if(progressView.progress==1){
                progressView.isHidden = true
            }
        }
    }
    @IBOutlet weak var progressView: UIProgressView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let url = URL(string: "http://api.pennlabs.org/dining/venues")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error!)
            }else{
                if let urlContent = data {
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        let names = (jsonResult).value(forKeyPath: "document.venue.name") as! NSArray
                        let imageURLs = (jsonResult).value(forKeyPath: "document.venue.facilityURL") as! NSArray
                        let url2 = URL(string: imageURLs[location] as! String)!
                        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
                        self.webView.load(URLRequest(url: url2))
                        self.webView.allowsBackForwardNavigationGestures = true
                        
                        self.navitem.title = names[location] as! String
                    }catch{
                        print("Json Processing Failed")
                    }
                }
            }
        }
        task.resume();
    }
}
var location:Int = 0
