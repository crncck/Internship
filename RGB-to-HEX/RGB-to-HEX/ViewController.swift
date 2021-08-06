//
//  ViewController.swift
//  RGB-to-HEX
//
//  Created by Ceren Çiçek on 6.08.2021.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    @IBOutlet weak var txtGreen: UITextField!

    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnConvert: UIButton!

    @IBOutlet weak var lblSelectedColor: UILabel!

    var chosenIndex : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func segmentChanged(_ sender: UISegmentedControl) {

        chosenIndex = sender.selectedSegmentIndex

        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtGreen.text?.removeAll()
        txtBlue.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white


        if chosenIndex == 0 {

            btnConvert.setTitle("Convert RGB to HEX", for: UIControl.State.normal)

        } else {

            btnConvert.setTitle("Convert HEX to RGB", for: UIControl.State.normal)

        }

    }

    @IBAction func btnConvertClicked(_ sender: UIButton) {

        if chosenIndex == 0 {

            // RGB to HEX
            convertRGBtoHEX()

        } else {

            // HEX to RGB
            convertHEXtoRGB()

        }
    }

    func convertRGBtoHEX() {

        guard let redValue = UInt8(txtRed.text!) else {return}
        guard let greenValue = UInt8(txtGreen.text!) else {return}
        guard let blueValue = UInt8(txtBlue.text!) else {return}


        let redHex = String(format: "%2X", redValue)
        let greenHex = String(format: "%2X", greenValue)
        let blueHex = String(format: "%2X", blueValue)

        lblResult.text = "HEX Color : #\(redHex)\(greenHex)\(blueHex)"
        lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)

    }



    func convertHEXtoRGB() {

        guard let redValue = UInt8(txtRed.text!, radix: 16) else {return}
        guard let greenValue = UInt8(txtGreen.text!, radix: 16) else {return}
        guard let blueValue = UInt8(txtBlue.text!, radix: 16) else {return}

        lblResult.text = "RED: \(redValue) \n GREEN: \(greenValue) \n BLUE: \(blueValue)"
        lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)

    }

}

