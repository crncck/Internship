//
//  ViewController.swift
//  BookApp
//
//  Created by Ceren Çiçek on 12.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgBook: UIImageView!
    @IBOutlet weak var lblBookName: UILabel!
    @IBOutlet weak var lblAuthorName: UILabel!
    @IBOutlet weak var lblPages: UILabel!
    @IBOutlet weak var lblGenre: UILabel!

    var book : Book?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let name = book?.name ?? "Unknown"
        let author = book?.author ?? "Unknown"
        let pages = book?.page ?? -1
        let genre = book?.genre ?? "Unknown"
        let image = book?.image ?? " "

        lblBookName.text = name
        lblAuthorName.text = author
        lblPages.text = "\(pages)"
        lblGenre.text = genre
        imgBook.image = UIImage(named: image)

    }


}

