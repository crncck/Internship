//
//  ViewController.swift
//  RollingDice
//
//  Created by Ceren Çiçek on 6.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgDice1: UIImageView!
    @IBOutlet weak var imgDice2: UIImageView!
    @IBOutlet weak var txtDiceValue: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.purple.cgColor, UIColor.cyan.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)

    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }

    func rollDice() {

        let dice1 = arc4random_uniform(6) + 1
        let dice2 = arc4random_uniform(6) + 1
        let diceValue = dice1 + dice2

        imgDice1.image = UIImage(named: String(dice1))
        imgDice2.image = UIImage(named: String(dice2))
        txtDiceValue.text = String(diceValue)

    }

}

