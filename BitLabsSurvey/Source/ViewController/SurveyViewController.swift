//
//  SurveyViewController.swift
//  BitLabsSurvey
//
//  Created by developer on 21/01/22.
//

import Foundation
import UIKit
import WebKit

class SurveyViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    static let identifier = String(describing: SurveyViewController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRequest()
    }
    
    private func loadRequest() {
        if let url = URL(string: "https://www.apple.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @IBAction func btnCloseTap() {
        self.dismiss(animated: true, completion: nil)
    }
}
