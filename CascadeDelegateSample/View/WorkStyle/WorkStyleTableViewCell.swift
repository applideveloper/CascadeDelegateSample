//
//  WorkStyleTableViewCell.swift
//  CascadeDelegateSample
//
//  Created by 荒木 敦 on 2016/12/10.
//  Copyright © 2016年 WishMatch, Inc. All rights reserved.
//

import UIKit

class WorkStyleTableViewCell: UITableViewCell {

    @IBOutlet weak var workStyleLabel: UILabel!
    @IBOutlet weak var checkMarkImageView: UIImageView!
    
    var isWorkStyleTableViewCellSelected: Bool = false {
        didSet {
            if isWorkStyleTableViewCellSelected {
                self.checkMarkImageView.isHidden = false
                self.checkMarkImageView.image = #imageLiteral(resourceName: "ic_done_18pt")
            } else {
                self.checkMarkImageView.isHidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
