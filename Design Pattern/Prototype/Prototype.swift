//
//  Prototype.swift
//  Design Pattern
//
//  Created by Uday on 28/08/21.
//

import Foundation

// Struct
struct NameStruct{
    var firstName: String
    var lastName: String
}

var jhon = NameStruct(firstName: "jhon", lastName: "cena")
var steve = jhon

func initiateStructNormally(){
    let jhon = NameStruct(firstName: "jhon", lastName: "cena")
    let mark = NameStruct(firstName: "mark", lastName: "henry")
}


func initiateStructByPrototype(){
    let jhon = NameStruct(firstName: "Jhon", lastName: "Cena")
    var mark = jhon //by usign old struct as prototype - to save initialization time
    mark.firstName = "mark"
    mark.lastName = "henry"
}


// Class

class NameClass: NSCopying{
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return NameClass(firstName: firstName, lastName: lastName)
    }
    
    func clone() -> NameClass {
        return self.copy() as! NameClass
    }
    
}

func initClassNormally(){
    let jhon = NameClass(firstName: "jhon", lastName: "cena")
    let mark = NameClass(firstName: "mark", lastName: "henry")
}

func initClassByPrototype(){
    let jhon = NameClass(firstName: "jhon", lastName: "Cena")
    let mark = jhon.clone()
    mark.firstName = "mark"
    mark.lastName = "henry"
}
