//
//  PageCell.swift
//  PlanetsApp
//
//  Created by Ceren Cicek on 26.08.2021.
//

import UIKit


class PageCell : UICollectionViewCell {
    
    var page : Page? {
        didSet {
           
            guard let page = page else { return }
            mercuryImage.image = UIImage(named: page.imageName)
            
            let attrText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            attrText.append(NSAttributedString(string: "\n\n\(page.description)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14) , NSAttributedString.Key.foregroundColor : UIColor.darkGray]))
            
            txtPlanetName.attributedText = attrText
            txtPlanetName.textAlignment = .center
            
        }
    }

    private let mercuryImage : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "mercury"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let txtPlanetName : UITextView = {
        
        let textView = UITextView()

        let attrText = NSMutableAttributedString(string: "The smallest planet in our solar system - Mercury", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attrText.append(NSAttributedString(string: "\n\n.From the surface of Mercury, the Sun would appear more than three times as large as it does when viewed from Earth, and the sunlight would be as much as seven times brighter. Despite its proximity to the Sun, Mercury is not the hottest planet in our solar system – that title belongs to nearby Venus, thanks to its dense atmosphere.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14) , NSAttributedString.Key.foregroundColor : UIColor.darkGray]))
        
        textView.attributedText = attrText
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        editLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Error")
    }
    
    
    private func editLayout() {
        
        let ustView = UIView()
        addSubview(ustView)

        ustView.translatesAutoresizingMaskIntoConstraints = false
        ustView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        ustView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        ustView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        ustView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        ustView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true

        ustView.addSubview(mercuryImage)

        mercuryImage.centerXAnchor.constraint(equalTo: ustView.centerXAnchor).isActive = true
        mercuryImage.centerYAnchor.constraint(equalTo: ustView.centerYAnchor).isActive = true
        mercuryImage.heightAnchor.constraint(equalTo: ustView.heightAnchor, multiplier: 0.6).isActive = true
        addSubview(txtPlanetName)
        txtPlanetName.topAnchor.constraint(equalTo: ustView.bottomAnchor, constant: 10).isActive = true
        txtPlanetName.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        txtPlanetName.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        txtPlanetName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true

    }
    
}
