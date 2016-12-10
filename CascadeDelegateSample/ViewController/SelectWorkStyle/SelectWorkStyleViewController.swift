//
//  SelectWorkStyleViewController.swift
//  CascadeDelegateSample
//
//  Created by 荒木 敦 on 2016/12/10.
//  Copyright © 2016年 WishMatch, Inc. All rights reserved.
//

import UIKit

class SelectWorkStyleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var workStyleTypeArray = [String]()
    
    var selectedWorkStyleArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        workStyleTypeArray.append(WorkStyleType.Arbeit.rawValue)
        workStyleTypeArray.append(WorkStyleType.Part.rawValue)
        workStyleTypeArray.append(WorkStyleType.RegularEmployee.rawValue)
        workStyleTypeArray.append(WorkStyleType.ContractEmployee.rawValue)
        workStyleTypeArray.append(WorkStyleType.TemporaryStaff.rawValue)
        workStyleTypeArray.append(WorkStyleType.Other.rawValue)
        
        // SelectWorkStyleViewController
        self.tableView.delegate = self
        // SelectWorkStyleViewController
        self.tableView.dataSource = self
        
        self.tableView.register(
            UINib(nibName : WorkStyleTableViewCell.className, bundle : nil),
            forCellReuseIdentifier: WorkStyleTableViewCell.className
        )
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapDesideButton(_ sender: Any) {
        if let searchCondition = SearchConditionManager.sharedManager.create() {
            var workStyleArray = [WorkStyle]()
            
            for workStyleType in self.workStyleTypeArray {
                if self.selectedWorkStyleArray.contains(workStyleType) {
                    if let workStyle = WorkStyleManager.sharedManager.create() {
                        workStyle.workStyleType = workStyleType
                        workStyleArray.append(workStyle)
                    }
                }
            }
            
            searchCondition.workStyleSet = NSOrderedSet(array: workStyleArray)
            
            SearchConditionManager.sharedManager.update(updateSearchCondition: searchCondition)
        }
        
        let _ = self.navigationController?.popViewController(animated: true)
    }
}

extension SelectWorkStyleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tableViewCell = self.tableView.cellForRow(at: indexPath)
    
        if let workStyleTableViewCell = tableViewCell as? WorkStyleTableViewCell  {
            if workStyleTableViewCell.isWorkStyleTableViewCellSelected {
                // すでに選択されていた時
                workStyleTableViewCell.isWorkStyleTableViewCellSelected = false
            } else {
                // 未選択の時
                workStyleTableViewCell.isWorkStyleTableViewCellSelected = true
            }
            
            if let workStyleLabelText = workStyleTableViewCell.workStyleLabel.text {
                if selectedWorkStyleArray.contains(workStyleLabelText) {
                    // すでに選択されていた時
                    let newSelectedWorkStyleArray = selectedWorkStyleArray.filter({ (workStyle: String) -> Bool in
                        if workStyle == workStyleLabelText {
                            return false
                        } else {
                            return true
                        }
                   })
                    
                    self.selectedWorkStyleArray = newSelectedWorkStyleArray
                } else {
                    self.selectedWorkStyleArray.append(workStyleLabelText)
                }
            }
        }
        
        self.tableView.reloadData()
    }
}

extension SelectWorkStyleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.workStyleTypeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let workStyleTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: WorkStyleTableViewCell.className) as? WorkStyleTableViewCell else {
            return ViewUtlity.getTableViewCell(color: UIColor.clear)
        }
        
        let workStyleType = workStyleTypeArray[indexPath.row]
        
        if self.selectedWorkStyleArray.contains(workStyleType) {
            workStyleTableViewCell.isWorkStyleTableViewCellSelected = true
        } else {
            workStyleTableViewCell.isWorkStyleTableViewCellSelected = false
        }
        
        workStyleTableViewCell.workStyleLabel.text = workStyleType
        
        return workStyleTableViewCell
    }
}
