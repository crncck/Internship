//
//  ViewController.swift
//  PlanetsApp
//
//  Created by Ceren Cicek on 26.08.2021.
//

import UIKit

class ViewController: UIViewController {

    
    let mercuryImage : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "mercury"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    let txtPlanetName : UITextView = {
        
        let textView = UITextView()

        let attrText = NSMutableAttributedString(string: "The smallest planet in our solar system - Mercury", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attrText.append(NSAttributedString(string: "\n\nFrom the surface of Mercury, the Sun would appear more than three times as large as it does when viewed from Earth, and the sunlight would be as much as seven times brighter. Despite its proximity to the Sun, Mercury is not the hottest planet in our solar system – that title belongs to nearby Venus, thanks to its dense atmosphere.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14) , NSAttributedString.Key.foregroundColor : UIColor.darkGray]))
        
        textView.attributedText = attrText
        
        
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    

    private let pageControl : UIPageControl = {
        let pControl = UIPageControl()
        pControl.currentPage = 0
        pControl.numberOfPages = 5
        pControl.currentPageIndicatorTintColor = UIColor.newRed
        pControl.pageIndicatorTintColor = UIColor.lightRed
        return pControl
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(txtPlanetName)
        buttonControl()
        editLayout()

    }

    fileprivate func buttonControl() {
        
        let buttonStackView = UIStackView(arrangedSubviews: [pageControl])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.distribution = .fillEqually
        
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func editLayout() {
        
        let topView = UIView()
        view.addSubview(topView)

        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        topView.addSubview(mercuryImage)

        mercuryImage.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        mercuryImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        mercuryImage.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.6).isActive = true
        txtPlanetName.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10).isActive = true
        txtPlanetName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        txtPlanetName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        txtPlanetName.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true        
    }

}

extension UIColor {
    static var newRed = UIColor(red: 229/255, green: 70/255, blue: 129/255, alpha: 1)
    static var lightRed = UIColor(red: 250/255, green: 210/255, blue: 215/255, alpha: 1)
}

