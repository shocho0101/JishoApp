//
//  ViewController.swift
//  JishoApp
//
//  Created by 張翔 on 2020/02/01.
//  Copyright © 2020 張翔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    var dictionary: [String: String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //csvのファイルパスを取得
        guard let path = Bundle.main.path(forResource:"meishi", ofType:"csv") else {
            print("csvファイルがないよ")
            return
        }
        
        //csvファイルを読み出し
        let csvString = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
        //読みだしたファイルを行ごとに分割
        let csvLines = csvString.components(separatedBy: .newlines)
        
        //１行ごとにdictionaryに入れる
        for line in csvLines {
            let wordArray = line.components(separatedBy: ",")
            if wordArray.count == 2{
                dictionary[wordArray[1]] = wordArray[0]
            }
        }
        
    }
    
    @IBAction func check() {
        if dictionary[textField.text!] != nil {
            label.text = dictionary[textField.text!]
        } else {
            label.text = "そんな単語は無いよ"
        }
        
    }


}

