//
//  DetailsViewController.swift
//  MoviesApp
//
//  Created by Ceren Çiçek on 16.08.2021.
//

import UIKit

class DetailsViewController: UIViewController {

    var chosenMovie : String = ""

    var chosenCategory : String = ""

    var index : Int = -1

    var data = Dataset()

    var movies = [Movie]()

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieDetails: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = chosenMovie

        movies = data.getMovies(category: chosenCategory)

        let movie = movies[index]

        movieImage.image = UIImage(named: movie.imageName)
        movieDetails.text = movie.details

    }

}
