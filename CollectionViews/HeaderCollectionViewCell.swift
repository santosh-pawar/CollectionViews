//
//  HeaderCollectionViewCell.swift
//  CollectionViews
//
//  Created by Santosh Pawar on 9/16/15.
//  Copyright © 2015 Santosh. All rights reserved.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    @IBOutlet var tabTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clearColor()
    }
}
