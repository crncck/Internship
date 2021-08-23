//
//  MovieCell.swift
//  MoviesApp
//
//  Created by Ceren Çiçek on 16.08.2021.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func editCell(movie: Movie) {
        movieImage.image = UIImage(named: movie.imageName)
        movieName.text = movie.name
    }

}
