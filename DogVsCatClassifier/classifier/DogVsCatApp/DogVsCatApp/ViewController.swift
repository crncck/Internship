//
//  ViewController.swift
//  DogVsCatApp
//
//  Created by Ceren Çiçek on 26.08.2021.
//

import UIKit
import CoreML

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{


    let model = DogCatClassifier()

    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    var imagePicker = UIImagePickerController()

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }

        @IBAction func setPicture(_ sender: Any) {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = false

                present(imagePicker, animated: true, completion: nil)
            }
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imageView.image = image
                if let buffer = image.buffer(with: CGSize(width:227, height:227)) {
                    guard let prediction = try? model.prediction(image: buffer) else {fatalError("Unexpected runtime error")}
                    let predictedValue = prediction.animalType
                    let probability = prediction.animalTypeProbability


                    if predictedValue == "Cat" {
                        descriptionLbl.text = "I think %\(String(format: "%.1f", probability["Cat"]!*100)) this is a \(predictedValue.lowercased())"
                    } else if predictedValue == "Dog" {
                        descriptionLbl.text = "With %\(String(format: "%.1f", probability["Dog"]!*100)) it seems like a \(predictedValue.lowercased()) to me"
                    }
                }else{
                    print("failed buffer")
                }
            }
            dismiss(animated:true, completion: nil)
        }

}


extension UIImage {
    func buffer(with size:CGSize) -> CVPixelBuffer? {
        if let image = self.cgImage {
            let frameSize = size
            var pixelBuffer:CVPixelBuffer? = nil
            let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(frameSize.width), Int(frameSize.height), kCVPixelFormatType_32BGRA , nil, &pixelBuffer)
            if status != kCVReturnSuccess {
                return nil
            }
            CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags.init(rawValue: 0))
            let data = CVPixelBufferGetBaseAddress(pixelBuffer!)
            let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
            let bitmapInfo = CGBitmapInfo(rawValue: CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.premultipliedFirst.rawValue)
            let context = CGContext(data: data, width: Int(frameSize.width), height: Int(frameSize.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: bitmapInfo.rawValue)
            context?.draw(image, in: CGRect(x: 0, y: 0, width: image.width, height: image.height))
            CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))

            return pixelBuffer
        }else{
            return nil
        }
    }
}

