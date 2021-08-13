//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ceren Çiçek on 13.08.2021.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1   // x
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]

    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true

    @IBOutlet weak var lblWon: UILabel!

    @IBAction func action(_ sender: AnyObject) {

        if (gameState[sender.tag-1] == 0 && gameIsActive == true) {

            gameState[sender.tag-1] = activePlayer

            if (activePlayer == 1) {

                sender.setImage(UIImage(named: "x"), for: UIControl.State())
                activePlayer = 2

            } else {

                sender.setImage(UIImage(named: "o"), for: UIControl.State())
                activePlayer = 1

            }
        }

        for combination in winningCombinations {

            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {

                gameIsActive = false

                if gameState[combination[0]] == 1 {

                    // x has won
                    lblWon.text = "X HAS WON!"

                } else {

                    // o has won
                    lblWon.text = "O HAS WON!"
                }

                playAgainButton.isHidden = false
                lblWon.isHidden = false

            }

        }

        gameIsActive = false

        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }

        if gameIsActive == false {
            lblWon.text = "IT WAS A DRAW"
            lblWon.isHidden = false
            playAgainButton.isHidden = false
        }

    }

    @IBOutlet weak var playAgainButton: UIButton!

    @IBAction func playAgainClicked(_ sender: UIButton) {

        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1

        playAgainButton.isHidden = true
        lblWon.isHidden = true

        for i in 1...9 {
            // remove images of the buttons
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }

    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

