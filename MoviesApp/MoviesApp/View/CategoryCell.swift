//
//  CategoryCell.swift
//  MoviesApp
//
//  Created by Ceren Çiçek on 16.08.2021.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var imgCategory: UIImageView!

    @IBOutlet weak var lblCategory: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        imgCategory.layer.cornerRadius = 10
        //imgCategory.alpha = 0.9

    }

    func editCell(movieCategory: MovieCategory) {
        imgCategory.image = UIImage(named: movieCategory.imageName)
        lblCategory.text = movieCategory.categoryName
    }
    
}
