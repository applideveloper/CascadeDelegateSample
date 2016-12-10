//
//  SearchCondition+CoreDataProperties.swift
//  CascadeDelegateSample
//
//  Created by 荒木 敦 on 2016/12/10.
//  Copyright © 2016年 WishMatch, Inc. All rights reserved.
//

import Foundation
import CoreData


extension SearchCondition {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SearchCondition> {
        return NSFetchRequest<SearchCondition>(entityName: "SearchCondition");
    }

    @NSManaged public var updateTime: NSDate?
    @NSManaged public var workStyleSet: NSOrderedSet?

}

// MARK: Generated accessors for workStyleSet
extension SearchCondition {

    @objc(insertObject:inWorkStyleSetAtIndex:)
    @NSManaged public func insertIntoWorkStyleSet(_ value: WorkStyle, at idx: Int)

    @objc(removeObjectFromWorkStyleSetAtIndex:)
    @NSManaged public func removeFromWorkStyleSet(at idx: Int)

    @objc(insertWorkStyleSet:atIndexes:)
    @NSManaged public func insertIntoWorkStyleSet(_ values: [WorkStyle], at indexes: NSIndexSet)

    @objc(removeWorkStyleSetAtIndexes:)
    @NSManaged public func removeFromWorkStyleSet(at indexes: NSIndexSet)

    @objc(replaceObjectInWorkStyleSetAtIndex:withObject:)
    @NSManaged public func replaceWorkStyleSet(at idx: Int, with value: WorkStyle)

    @objc(replaceWorkStyleSetAtIndexes:withWorkStyleSet:)
    @NSManaged public func replaceWorkStyleSet(at indexes: NSIndexSet, with values: [WorkStyle])

    @objc(addWorkStyleSetObject:)
    @NSManaged public func addToWorkStyleSet(_ value: WorkStyle)

    @objc(removeWorkStyleSetObject:)
    @NSManaged public func removeFromWorkStyleSet(_ value: WorkStyle)

    @objc(addWorkStyleSet:)
    @NSManaged public func addToWorkStyleSet(_ values: NSOrderedSet)

    @objc(removeWorkStyleSet:)
    @NSManaged public func removeFromWorkStyleSet(_ values: NSOrderedSet)

}
