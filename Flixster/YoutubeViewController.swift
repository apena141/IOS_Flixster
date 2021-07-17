//
//  YoutubeViewController.swift
//  Flixster
//
//  Created by Anthony Pena on 7/17/21.
//

import UIKit
import WebKit

class YoutubeViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    var id = ""
    let baseUrl = "https://www.youtube.com/watch?v="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fullUrl = baseUrl + id
        let myUrl = URL(string: baseUrl + id)
        let request = URLRequest(url: myUrl!)
        webView.load(request)
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
