//
//  ViewController.swift
//  HW 2.1
//
//  Created by Дина on 10.11.2021.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

/* enum можно и класс ниже внести, но лучше либо вне, либо делать отдельный файл. Если все же в классе, то лучше писать экспеншен */

class ViewController: UIViewController {
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var yellowLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
   
    @IBOutlet var button: UIButton!
    
    private var currentLight = CurrentLight.red

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 10
        button.setTitle("START", for: .normal)
        
        redLabel.alpha = 0.3
        greenLabel.alpha = 0.3
        yellowLabel.alpha = 0.3
    }
    // т.к. у меня все крадраты динамичны то использую метод viewWillLayoutSubviews если бы не зависили можно было бы перенести в viewDidLoad
    
    override func viewWillLayoutSubviews() {
        redLabel.layer.cornerRadius = redLabel.frame.width / 2
        yellowLabel.layer.cornerRadius = yellowLabel.frame.width / 2
        greenLabel.layer.cornerRadius = greenLabel.frame.width / 2
    }

    @IBAction func button(_ sender: UIButton) {

        button.setTitle("NEXT", for: .normal)
       
        switch currentLight {
        case .red:
            greenLabel.alpha = 0.3
            redLabel.alpha = 1
            currentLight = .yellow
        case .yellow:
            redLabel.alpha = 0.3
            yellowLabel.alpha = 1
            currentLight = .green
        case .green:
            greenLabel.alpha = 1
            yellowLabel.alpha = 0.3
            currentLight = .red
        }
    }
}

