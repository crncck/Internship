//
//  MovieCell.swift
//  MoviesApp
//
//  Created by Ceren Çiçek on 16.08.2021.
//

import UIKit

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var imgMovie: UIImageView!

    override class func awakeFromNib() {
        super.awakeFromNib()

        imgMovie.layer.cornerRadius = 10
    }
}
