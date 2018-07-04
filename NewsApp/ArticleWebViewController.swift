//
//  ArticleWebViewController.swift
//  NewsApp
//
//  Created by Ирина Жогова on 04.07.2018.
//  Copyright © 2018 Irina Zhogova. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebViewController: UIViewController {
    
    var article = Article()

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: article.url) {
            webView.load(URLRequest(url: url))
        }
    }

   
   

}
