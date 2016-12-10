//
//  MainViewController.swift
//  CascadeDelegateSample
//
//  Created by 荒木 敦 on 2016/12/10.
//  Copyright © 2016年 WishMatch, Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        var viewControllerArray = [UIViewController]()
        
        let searchConditionStoryboard = UIStoryboard(name: Constraints.SearchConditionStoryboard.rawValue, bundle: nil)
        
        guard let searchConditionNavigationController = searchConditionStoryboard.instantiateInitialViewController() else {
            // FIXME: send error report
            return
        }
        
//        viewControllerArray.append(searchConditionNavigationController)
//
//        let tabBarController = UITabBarController()
//        tabBarController.viewControllers = viewControllerArray
        
        UIApplication.shared.windows[0].rootViewController = searchConditionNavigationController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
