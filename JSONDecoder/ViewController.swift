//
//  ViewController.swift
//  JSONDecoder
//
//  Created by Neha Pant on 25/09/2019.
//  Copyright © 2019 Neha Pant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromJSONUsingCodable()
        getDataFromJSONUsingSerialzation()
        // Do any additional setup after loading the view.
    }
    
    /**
     Parsing JSON using Codable
     **/
    func getDataFromJSONUsingCodable() {
        if let path = Bundle.main.path(forResource: "PersonRecords", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let decoder = JSONDecoder()
                let personData = try decoder.decode(Records.self, from: data)
                for i in 0..<personData.person.count {
                    print("person age - \(personData.person[i].age)")
                    print("person employed - \(personData.person[i].employed)")
                    print("person employed - \(personData.person[i].name)")
                }
                
            } catch let err {
                // handle error
                print(err)
            }
        }
    }
    
    /**
     Parsing JSON using Serialization
     **/
    func getDataFromJSONUsingSerialzation() {
        if let path = Bundle.main.path(forResource: "PersonRecords", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let dictionary = json as? [String: Any] {
                    let array:[Any] = dictionary["person"] as! [Any]
                    for i in 0..<array.count {
                        let dict:[String:Any] = array[i] as! [String : Any]
                        print("person age - \(String(describing: dict["person_age"]))")
                        print("person employed - \(String(describing: dict["employed"]))")
                        print("person employed - \(String(describing: dict["name"]))")
                    }
                }
                
            } catch let err {
                // handle error
                print(err)
            }
        }
    }
    
}

