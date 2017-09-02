//
//  WebViewController.swift
//  WorldTrotter
//
//  This is the view controller for the bronze challenge
//
//  Created by Stefano Pernat on 02/09/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    let pageToLoad = "www.bignerdranch.com"
    var webView: WKWebView!
    
    override func viewDidLoad() {
        webView = WKWebView()
        webView.load(URLRequest(url: URL(string: "https://\(pageToLoad)")!))
        
        view = webView
        print("WebViewController loaded its view")
    }
}
