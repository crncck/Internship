//
//  CollectionViewController.swift
//  BookApp
//
//  Created by Ceren Çiçek on 12.08.2021.
//

import UIKit

private let reuseIdentifier = "CellName"

struct Book {
    var name: String
    var author: String
    var image: String
    var page: Int
    var genre: String
}

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    enum Constants {

        static let rowElementNumber : CGFloat = 3
        static let space : CGFloat = 4
    }

    var chosenIndex = 0
    var books : [Book] = [Book]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()

        let width = collectionView.frame.width / Constants.rowElementNumber - Constants.space
        let height = width

        layout.itemSize = CGSize(width: width, height: height)

        layout.minimumInteritemSpacing = Constants.space
        layout.minimumLineSpacing = Constants.space

        collectionView.collectionViewLayout = layout

        let book1 = Book(name: "Chess", author: "Stefan Zweig", image: "chess", page: 104, genre: "Novella")
        let book2 = Book(name: "Martin Eden", author: "Jack London", image: "martin", page: 336, genre: "Künstlerroman")
        let book3 = Book(name: "Cosmos", author: "Carl Sagan", image: "cosmos", page: 200, genre: "Science")
        let book4 = Book(name: "Jane Eyre", author: "Charlotte Brontë", image: "jane", page: 480, genre: "Novel")
        let book5 = Book(name: "Hackers", author: "Steven Levy", image: "hackers", page: 430, genre: "Non-fiction")

        books.append(book1)
        books.append(book2)
        books.append(book3)
        books.append(book4)
        books.append(book5)

    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        if let customCell = cell as? CollectionViewCell {

            customCell.lblBookName.text = books[indexPath.row].name
            return customCell

        }

        return cell

    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        chosenIndex = indexPath.row

        performSegue(withIdentifier: "details", sender: self)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let vc = segue.destination as? ViewController {

            vc.book = books[chosenIndex]

        }


    }

}
