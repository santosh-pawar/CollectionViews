//
//  ViewController.swift
//  CollectionViews
//
//  Created by Santosh Pawar on 9/15/15.
//  Copyright © 2015 Santosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var headerCollectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    
    var selectedIndexPath: NSIndexPath?
    var images = [String]()
    let layout = UICollectionViewFlowLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        layout.minimumInteritemSpacing = 30
        layout.collectionViewContentSize()
        layout.itemSize = CGSizeMake(100, 40)
        layout.scrollDirection = .Horizontal
        headerCollectionView.frame = CGRectMake(0, 0, 100, 40)
        headerCollectionView.setCollectionViewLayout(layout, animated: true)
        headerCollectionView.registerNib(UINib(nibName: "HeaderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HeaderCollectionViewCell")
        tableView.registerNib(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        headerCollectionView.backgroundColor = UIColor.clearColor()
        images = ["1","2","3","4","5","6","7","8","9","10"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = headerCollectionView.dequeueReusableCellWithReuseIdentifier("HeaderCollectionViewCell", forIndexPath: indexPath) as! HeaderCollectionViewCell
        cell.tabTitle.text = "Tab \(indexPath.row)"
        if selectedIndexPath == indexPath {
            cell.backgroundColor = UIColor.lightGrayColor()
        }else{
            cell.backgroundColor = UIColor.clearColor()
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(100, 40)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let _ = selectedIndexPath {
            if let cell = headerCollectionView.cellForItemAtIndexPath(indexPath) {
                cell.backgroundColor = UIColor.clearColor()
            }
        }
        if let cell = headerCollectionView.cellForItemAtIndexPath(indexPath) {
            cell.backgroundColor = UIColor.lightGrayColor()
        }
        selectedIndexPath = indexPath
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        headerCollectionView.cellForItemAtIndexPath(indexPath)?.backgroundColor = UIColor.clearColor()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsTableViewCell", forIndexPath: indexPath) as! NewsTableViewCell
        let imageName = NSBundle.mainBundle().pathForResource(images[indexPath.row], ofType: "jpg", inDirectory: "Images")
        let image = UIImage(named: imageName!)
        cell.newsImageView.image = image
        cell.textView.text = "News heading for cell: \(indexPath.row+1)"
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
}


