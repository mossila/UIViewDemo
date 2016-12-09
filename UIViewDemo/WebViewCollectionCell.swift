//
//  WebViewCollectionCell.swift
//  UIViewDemo
//
//  Created by Sutean Rutjanalard on 12/9/2559 BE.
//  Copyright © 2559 Sutean Rutjanalard. All rights reserved.
//

import UIKit
protocol WebViewCollectionCellDelegate:class {
    func didTryToDelete(_ cell:WebViewCollectionCell) -> Void
}
class WebViewCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var webView: UIWebView!
    weak var delegate:WebViewCollectionCellDelegate?
    @IBAction func deleteButton(_ sender: UIButton) {
        delegate?.didTryToDelete(self)
    }
}

