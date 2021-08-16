//
//  DetailsViewController.swift
//  NotesApp
//
//  Created by Ceren Çiçek on 16.08.2021.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var lblNoteDetails: UITextView!
    var detail: String = ""

    var masterView : ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblNoteDetails.text = detail
    }

    func setDetail(a : String) {

        detail = a
        if isViewLoaded {
            lblNoteDetails.text = detail
        }
    }

    override func viewWillDisappear(_ animated: Bool) {

        masterView?.noteDetail = lblNoteDetails.text
        lblNoteDetails.resignFirstResponder()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblNoteDetails.becomeFirstResponder()
    }

}
