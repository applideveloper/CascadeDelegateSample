//
//  WorkStyleManager.swift
//  CascadeDelegateSample
//
//  Created by 荒木 敦 on 2016/12/10.
//  Copyright © 2016年 WishMatch, Inc. All rights reserved.
//

import UIKit
import CoreData

class WorkStyleManager: NSObject {
    static let sharedManager = WorkStyleManager()
    
    private override init() {
        
    }
    
    func create() -> WorkStyle? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            // FIXME: send error report
            return nil
        }
        
        let viewContext = appDelegate.persistentContainer.viewContext
        
        guard let workStyleEntity = NSEntityDescription.entity(forEntityName: WorkStyle.className, in: viewContext) else {
            // FIXME: send error report
            return nil
        }
        
        guard let workStyle = NSManagedObject(entity: workStyleEntity, insertInto: viewContext) as? WorkStyle else {
            return nil
        }
        
        do {
            try viewContext.save()
            return workStyle
        } catch let error as NSError {
            // FIXME: send error report
            print("error.description = \(error.description)")
            return nil
        }
    }
}
