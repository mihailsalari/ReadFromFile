//
//  UIKit Extensions.swift
//  ReadFromFile
//
//  Created by Mihail Salari on 1/10/17.
//  Copyright © 2017 Mihail Salari. All rights reserved.
//

import UIKit

// MARK: - UIViewController

extension UIViewController {
    
    var contentViewController: UIViewController {
        if let navCon = self as? UINavigationController {
            return navCon.visibleViewController ?? self
        } else {
            return self
        }
    }
}


// MARK: - UITableView

extension UITableView {
    
    func hideEmptyCells() {
        let customFooterView = UIView(frame: CGRect.zero)
        self.tableFooterView = customFooterView
    }
}
