//
//  SearchConditionViewController.swift
//  CascadeDelegateSample
//
//  Created by 荒木 敦 on 2016/12/10.
//  Copyright © 2016年 WishMatch, Inc. All rights reserved.
//

import UIKit

class SearchConditionViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchConditionArray = [SearchCondition]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "条件選択"
        
        // UITableViewDelegate
        self.tableView.delegate = self
        // UITableViewDataSource
        self.tableView.dataSource = self
        
        self.tableView.register(
            UINib(
                nibName : SelectWorkStyleTableViewCell.className,
                bundle : nil
            ),
            forCellReuseIdentifier: SelectWorkStyleTableViewCell.className
        )
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchConditionArray = SearchConditionManager.sharedManager.fetchAll() ?? [SearchCondition]()
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SearchConditionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let tableViewCell = self.tableView.cellForRow(at: indexPath),
           tableViewCell.className == SelectWorkStyleTableViewCell.className {
            
            let workStyleStoryboard = UIStoryboard(name: Constraints.WorkStyleStoryboard.rawValue, bundle: nil)
            
            guard let selectWorkStyleViewController = workStyleStoryboard.instantiateInitialViewController() as? SelectWorkStyleViewController else {
                // send error report
                return
            }
            
            if searchConditionArray.count > 0 {
                let searchCondition = self.searchConditionArray[indexPath.row]
                
                if let workStyleSet = searchCondition.workStyleSet,
                    let workStyleArray = workStyleSet.array as? [WorkStyle] {
                    
                    var selectedWorkStyleArray = [String]()
                    
                    for workStyle in workStyleArray {
                        selectedWorkStyleArray.append(workStyle.workStyleType ?? "")
                    }

                    selectWorkStyleViewController.selectedWorkStyleArray = selectedWorkStyleArray
                    
                }
            }
            
            self.navigationController?.pushViewController(selectWorkStyleViewController, animated: true)
        }
    }
}

extension SearchConditionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchConditionArray.count == 0 {
            return 1
        } else {
            return searchConditionArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let selectWorkStyleTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: SelectWorkStyleTableViewCell.className) as? SelectWorkStyleTableViewCell else {
            return ViewUtlity.getTableViewCell(color: UIColor.clear)
        }
        
        if searchConditionArray.count == 0 {
            selectWorkStyleTableViewCell.workStyleLabel.text = "指定なし"
        } else {
            let searchCondition = self.searchConditionArray[indexPath.row]
            
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
                
                print(workStyleString)
                
                if workStyleString.isEmpty == true {
                    selectWorkStyleTableViewCell.workStyleLabel.text = "指定なし"
                } else {
                    selectWorkStyleTableViewCell.workStyleLabel.text = workStyleString
                }
                
            }
        }
        
        return selectWorkStyleTableViewCell
    }
}

