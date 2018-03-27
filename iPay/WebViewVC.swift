////
//  WebViewVC.swift
//  iPay
//
//  Created by CodeX on 23/02/2018.
//  Copyright © 2018 Dev_iOS. All rights reserved.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    var url:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webURL:URL = URL(string: url)!
        webView.load(URLRequest(url: webURL))
        
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    deinit {
        print("deinitialized webview class")
    }

}
