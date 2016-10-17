//
//  Violations.swift
//  AC3.2-Violations
//
//  Created by Ilmira Estil on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Violations {
    let boro: String
    let building: String
    let violationDescription: String
    
    init(boro: String, building: String, violationDescription: String) {
        self.boro = boro
        self.building = building
        self.violationDescription = violationDescription
    }
    
    convenience init?(withDict dict: [String: Any]) {
        if let boro = dict["boro"] as? String,
        let building = dict["building"] as? String,
        let violationDescription = dict["violation_description"] as? String {
            self.init(boro: boro, building: building, violationDescription: violationDescription)
        } else {
            return nil
        }
    }
    
}


/*
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
 */
