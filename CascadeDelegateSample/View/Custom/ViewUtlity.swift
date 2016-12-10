//
//  ViewUtlity.swift
//  CascadeDelegateSample
//
//  Created by 荒木 敦 on 2016/12/10.
//  Copyright © 2016年 WishMatch, Inc. All rights reserved.
//

import UIKit

class ViewUtlity: NSObject {
    class func getTableViewCell(color: UIColor) -> UITableViewCell {
        let tableViewCell = UITableViewCell()
        tableViewCell.backgroundColor = color
        tableViewCell.selectionStyle = UITableViewCellSelectionStyle.none
        return tableViewCell
    }
}
