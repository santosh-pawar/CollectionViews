//
//  NewsTableViewCell.swift
//  CollectionViews
//
//  Created by Santosh Pawar on 9/19/15.
//  Copyright © 2015 Santosh. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var textView: UITextView!
    @IBOutlet var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
