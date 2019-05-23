//
//  ViewController.swift
//  RamTest
//
//  Created by D7703_24 on 2019. 5. 23..
//  Copyright © 2019년 D7703_24. All rights reserved.
//

import UIKit
import RealmSwift

class Person: Object{
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}

class ViewController: UIViewController {

    @IBOutlet weak var txtValue: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var disView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btAdd(_ sender: Any) {
        let person = Person()
        
        person.name = txtValue.text!
        person.age = Int(txtAge.text!)!
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(person)
        }
    }
    
    @IBAction func btDel(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    @IBAction func btGet(_ sender: Any) {
        txtValue.text = ""
        
        let realm = try! Realm()
        let vals = realm.objects(Person.self)
        
        if vals.count == 0{
            return
        }else{
            for i in vals{
                disView.text = txtValue.text! + "Name : \(i.name), Age : \(i.age)\n"
            }
        }
    }
    
}

