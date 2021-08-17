//
//  ViewController.swift
//  MoviesApp
//
//  Created by Ceren Çiçek on 16.08.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var chosenCategoryName : String = ""

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "categorycell") as? CategoryCell {
            cell.editCell(movieCategory: data.categories[indexPath.row])
            return cell
        }

        return UITableViewCell()

    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenCategoryName = data.categories[indexPath.row].categoryName
        performSegue(withIdentifier: "movieList", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movieListViewController = segue.destination as? MovieListViewController {
            movieListViewController.chosenCategoryName = chosenCategoryName
        }
    }



    var data = Dataset()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }




}

