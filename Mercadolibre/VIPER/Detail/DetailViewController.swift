//
//  DetailViewController.swift
//  Mercadolibre
//
//  Created by Asesoftware on 8/05/22.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var urlDetailItem = ""

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: urlDetailItem)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }
    

}
