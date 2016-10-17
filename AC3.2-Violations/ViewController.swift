//
//  ViewController.swift
//  AC3.2-Violations
//
//  Created by Jason Gresh on 10/15/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func loadData() {
        guard let path = Bundle.main.path(forResource: "violations", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options:  NSData.ReadingOptions.mappedIfSafe),
            let violationsJSON = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as? NSArray else {
                return
        }
        
        if let violations = violationsJSON as? [[String:Any]] {
            for violationDict in violations {
                if let ep = Violation(withDict: violationDict) {
                    self.episodes.append(ep)
                }
            }
        }
        
    }
}

