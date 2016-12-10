//
//  SearchConditionManager.swift
//  CascadeDelegateSample
//
//  Created by 荒木 敦 on 2016/12/10.
//  Copyright © 2016年 WishMatch, Inc. All rights reserved.
//

import UIKit
import CoreData

class SearchConditionManager: NSObject {
    
    static let sharedManager = SearchConditionManager()
    
    private override init() {
        
    }
    
    func create() -> SearchCondition? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            // FIXME: send error report
            return nil
        }
        
        let viewContext = appDelegate.persistentContainer.viewContext

        guard let searchConditionEntity = NSEntityDescription.entity(forEntityName: SearchCondition.className, in: viewContext) else {
            // FIXME: send error report
            return nil
        }
        
        guard let searchCondition = NSManagedObject(entity: searchConditionEntity, insertInto: viewContext) as? SearchCondition else {
            return nil
        }
        
        do {
            try viewContext.save()
            return searchCondition
        } catch let error as NSError {
            // FIXME: send error report
            print("error.description = \(error.description)")
            return nil
        }
    }

    func fetchAll() -> [SearchCondition]? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            // FIXME: send error report
            return nil
        }
        
        let viewContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<SearchCondition> = SearchCondition.fetchRequest()
        
        //ascendind:true 昇順、false 降順です
        let sortDescripter = NSSortDescriptor(key: "updateTime", ascending: false)
        fetchRequest.sortDescriptors = [sortDescripter]
        
        do {
            return try viewContext.fetch(fetchRequest)
            
        } catch let error as NSError {
            // FIXME: send error report
            print("error.description = \(error.description)")
            return nil
        }
    }
    
    func update(updateSearchCondition: SearchCondition) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            // FIXME: send error report
            return
        }
        
        let viewContext = appDelegate.persistentContainer.viewContext
        
        if let searchCondition = self.create() {
            searchCondition.workStyleSet = updateSearchCondition.workStyleSet
            searchCondition.updateTime = NSDate()
        }
        
        do {
            try viewContext.save()
            
            
            if let searchConditionArray = self.fetchAll(),
                searchConditionArray.count >= 2 {
                
                print("start")
                for searchCondition in searchConditionArray {
                    if let workStyleSet = searchCondition.workStyleSet,
                        let workStyleArray = workStyleSet.array as? [WorkStyle] {
                        var workStyleString = ""
                        
                        for (index, workStyle) in workStyleArray.enumerated() {
                            if let workStyleType = workStyle.workStyleType,
                               workStyleType.isEmpty == false {
                                if index == 0 {
                                    workStyleString += workStyleType
                                } else {
                                    workStyleString += "," + workStyleType
                                }
                            }
                        }
                        
                        if workStyleString.isEmpty == true {
                            workStyleString = "指定なし"
                        }
                        print(workStyleString)
                    }
                }
                print("end")
                
                
                for (index, searchCondition) in searchConditionArray.enumerated() {
                    if index == 0 {
                        continue
                    }
                    
                    self.delete(searchCondition: searchCondition)
                }
            }
            
        } catch let error as NSError {
            // FIXME: send error report
            print("error.description = \(error.description)")
        }
    }
    
    func delete(searchCondition: SearchCondition){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            // FIXME: send error report
            return
        }
        
        let viewContext = appDelegate.persistentContainer.viewContext
       
        viewContext.delete(searchCondition)
        
        do {

            try viewContext.save()
        } catch let error as NSError {
            // FIXME: send error report
            print("error.description = \(error.description)")
            return
        }
        
    }
}
