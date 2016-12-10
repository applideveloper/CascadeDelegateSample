//
//  Constraints.swift
//  CascadeDelegateSample
//
//  Created by 荒木 敦 on 2016/12/10.
//  Copyright © 2016年 WishMatch, Inc. All rights reserved.
//

import Foundation

enum Constraints: String {
    case Main = "Main"
    case SearchConditionStoryboard = "SearchConditionStoryboard"
    case WorkStyleStoryboard = "WorkStyleStoryboard"
}

enum WorkStyleType: String {
    case Arbeit = "アルバイト"
    case Part = "パート"
    case RegularEmployee = "正社員"
    case ContractEmployee = "契約社員"
    case TemporaryStaff = "派遣社員"
    case Other = "その他"
}
