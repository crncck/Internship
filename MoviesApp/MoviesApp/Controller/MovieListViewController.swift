//
//  MovieListViewController.swift
//  MoviesApp
//
//  Created by Ceren Çiçek on 16.08.2021.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var chosenCategoryName : String = ""

    var chosenMovie : String = ""

    var chosenIndex : Int = -1

    var data = Dataset()

    var movies = [Movie]()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        movies = data.getMovies(category: chosenCategoryName)

        self.title = "Category: \(chosenCategoryName)"

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as? MovieCell {
            cell.editCell(movie: movies[indexPath.row])
            return cell
        }

        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenMovie = movies[indexPath.row].name
        chosenIndex = indexPath.row
        performSegue(withIdentifier: "goDetails", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsViewController = segue.destination as? DetailsViewController {
            detailsViewController.chosenMovie = chosenMovie
            detailsViewController.chosenCategory = chosenCategoryName
            detailsViewController.index = chosenIndex
        }
    }

}
