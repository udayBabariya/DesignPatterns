//
//  ViewController.swift
//  Design Pattern
//
//  Created by Uday on 19/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    let serialQueue = DispatchQueue(label: "serial")
    let concurrent = DispatchQueue(label: "concurrent",attributes: .concurrent)

    override func viewDidLoad() {
        super.viewDidLoad()
        serialTask()
        let tap = UITapGestureRecognizer(target: self, action: #selector(serialTask))
        self.view.addGestureRecognizer(tap)
    }

    @objc func serialTask() {
        concurrent.sync {
            for _ in 0..<20000 {
                print("1-")
            }
            
            for _ in 0..<20000 {
                print("2--")
            }
        }
        print("123")
        concurrent.sync {
            for _ in 0..<20000 {
                print("3---")
            }
            for _ in 0..<20000 {
                print("4----")
            }
        }
        print("1234")
    }

}

