//
//  ViewController.swift
//  UIViewDemo
//
//  Created by Sutean Rutjanalard on 12/9/2559 BE.
//  Copyright © 2559 Sutean Rutjanalard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gWebView: UIWebView!
    @IBOutlet weak var fWebView: UIWebView!
    @IBOutlet weak var tWebView: UIWebView!
    @IBOutlet weak var googleGroup: UIView!
    
    @IBOutlet weak var twitterGroup: UIView!
    @IBOutlet weak var facebookGroup: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let googleURL = URL(string: "https://www.google.com")!
        let facebookURL = URL(string: "https://www.facebook.com")!
        let twitterURL = URL(string: "https://www.twitter.com")!
        gWebView.loadRequest(URLRequest(url: googleURL))
        fWebView.loadRequest(URLRequest(url: facebookURL))
        tWebView.loadRequest(URLRequest(url: twitterURL))
        
    }
    enum ButtonTag:Int {
        case google = 1
        case facebook = 2
        case twitter = 3
    }
    
    @IBAction func closeView(_ sender: UIButton) {
        let tag:ButtonTag = ButtonTag.init(rawValue: sender.tag)!
        switch tag {
        case .google:
            googleGroup.removeFromSuperview()
        case .facebook:
            facebookGroup.removeFromSuperview()
        case .twitter:
            twitterGroup.removeFromSuperview()
        }
    }

}

