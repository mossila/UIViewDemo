//
//  CollectionDemoViewController.swift
//  UIViewDemo
//
//  Created by Sutean Rutjanalard on 12/9/2559 BE.
//  Copyright © 2559 Sutean Rutjanalard. All rights reserved.
//

import UIKit

class CollectionDemoViewController: UIViewController {
    let webURLs = ["https://www.google.com", "https://www.facebook.com", "https://www.twitter.com"]
    var webUrlToDisplay:[String]?
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webUrlToDisplay = webURLs
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
    }
    

    func addAction() {
        collectionView.performBatchUpdates({ 
            [unowned self] in
            self.webUrlToDisplay?.insert("https://www.apple.com",at:0)
            self.collectionView.insertItems(at: [IndexPath.init(row: 0, section: 0)])

        }, completion: nil)
        
        navigationItem.rightBarButtonItem?.isEnabled = false
        
    }
}
fileprivate struct Identifier  {
    static let webViewCell = "WebViewCollectionCell"

}
extension CollectionDemoViewController:UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return webUrlToDisplay?.count ?? 0
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.webViewCell,
                                                      for: indexPath) as! WebViewCollectionCell
        guard let url = URL(string:webUrlToDisplay?[indexPath.row] ?? "") else {
            return cell
        }
        cell.title.text = url.host
        cell.webView.loadRequest(URLRequest(url: url))
        cell.delegate = self
        return cell
    }
}
extension CollectionDemoViewController: WebViewCollectionCellDelegate {
    func didTryToDelete(_ cell: WebViewCollectionCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            collectionView.performBatchUpdates({ [unowned self] in
                self.webUrlToDisplay?.remove(at: indexPath.row)
                self.collectionView.deleteItems(at: [indexPath])
            }, completion: nil)
        }
    }
    
}
