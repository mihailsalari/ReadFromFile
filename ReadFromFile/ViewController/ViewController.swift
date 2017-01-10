//
//  ViewController.swift
//  ReadFromFile
//
//  Created by Mihail Salari on 1/10/17.
//  Copyright © 2017 Mihail Salari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var textView: UITextView!
    
    var text: String!
    
    
    // MARK: - LyfeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textView.text = text
        automaticallyAdjustsScrollViewInsets = false
    }
}
