//
//  WorkStyle+CoreDataProperties.swift
//  CascadeDelegateSample
//
//  Created by 荒木 敦 on 2016/12/10.
//  Copyright © 2016年 WishMatch, Inc. All rights reserved.
//

import Foundation
import CoreData


extension WorkStyle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkStyle> {
        return NSFetchRequest<WorkStyle>(entityName: "WorkStyle");
    }

    @NSManaged public var workStyleType: String?
    @NSManaged public var workStyle: SearchCondition?

}
