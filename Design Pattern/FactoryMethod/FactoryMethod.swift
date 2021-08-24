//
//  FactoryMethod.swift
//  Design Pattern
//
//  Created by Uday on 24/08/21.
//

import UIKit

protocol Serializable {
    func serialize()
}

enum Serializers{
    case json,plist,xml
}

class JSONSerializable: Serializable{
    func serialize() { print("JSONSerializer \(#function)") }
}

class PlistSerializable: Serializable{
    func serialize() { print("PlistSerializer \(#function)") }
}

class XMLSerializable: Serializable{
    func serialize() { print("XMLSerializer \(#function)") }
}

struct SerializableFactory{
   static  func makeSerializer(_ type: Serializers) -> Serializable?{
        let result: Serializable?
        switch type{
        case .json: result = JSONSerializable()
        case .plist: result = PlistSerializable()
        case .xml: result = XMLSerializable()
        }
        return result
    }
}

class ViewController2: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonSerializer = SerializableFactory.makeSerializer(.json)
        jsonSerializer?.serialize()
        let xmlSerializer = SerializableFactory.makeSerializer(.xml)
        xmlSerializer?.serialize()
        let plistSerializer = SerializableFactory.makeSerializer(.plist)
        plistSerializer?.serialize()
    }
}
