//
//  ViewController.swift
//  NotesApp
//
//  Created by Ceren Çiçek on 13.08.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var table: UITableView!

    var fileURL : URL!

    var notes : [String] = []
    var counter : Int = 0
    var selectedRow : Int = -1

    var noteDetails : [String] = []

    var noteDetail : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self
        table.delegate = self

        self.navigationItem.largeTitleDisplayMode = .always

        let editButton = editButtonItem
        editButton.tintColor = UIColor.systemYellow
        self.navigationItem.rightBarButtonItems?.append(editButton)

        let baseURL = try! FileManager.default.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: false)

        print(baseURL)

        fileURL = baseURL.appendingPathComponent("Notes.txt")

        //UserDefaults.standard.removeObject(forKey: "notes")

        loadData()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)


        if selectedRow == -1 {
            return
        }

        if noteDetail == "" {
            noteDetails.remove(at: selectedRow)
            notes.remove(at: selectedRow)
        } else if noteDetail == noteDetails[selectedRow] {
            return
        } else {
            noteDetails[selectedRow] = noteDetail
        }
        saveData()
        table.reloadData()

    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return notes.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //let cell : UITableViewCell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = notes[indexPath.row]
        return cell

    }


    @IBAction func btnAddClicked(_ sender: UIBarButtonItem) {

        if table.isEditing == true {
            return
        }

        let alert = UIAlertController(title: "Add", message: "Add the title of your note.", preferredStyle: UIAlertController.Style.alert)

        alert.addTextField(configurationHandler: { txtNoteName in

            txtNoteName.placeholder = "Note Name"
        })

        let actionAdd = UIAlertAction(title: "Add", style: UIAlertAction.Style.default, handler: { action in

            let firstTextField = alert.textFields![0] as UITextField
            self.addNote(noteName: firstTextField.text!)
        })

        let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)

        alert.addAction(actionAdd)
        alert.addAction(actionCancel)
        self.present(alert, animated: true, completion: nil)

    }

    func addNote(noteName: String) {

        notes.insert(noteName, at: 0)
        noteDetails.insert("Unknown", at: 0)
        let indexPath : IndexPath = IndexPath(row: 0, section: 0)

        table.insertRows(at: [indexPath], with: UITableView.RowAnimation.left)

        saveData()

        table.selectRow(at: indexPath, animated: true, scrollPosition: .none)

        performSegue(withIdentifier: "goDetails", sender: self)

    }

    override func setEditing(_ editing: Bool, animated: Bool) {

        super.setEditing(editing, animated: animated)
        table.setEditing(editing, animated: animated)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            noteDetails.remove(at: indexPath.row)
            table.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
            saveData()
        }
    }

    func saveData() {

        UserDefaults.standard.set(notes, forKey: "notes")
        UserDefaults.standard.set(noteDetails, forKey: "details")

        /*
        let data = NSArray(array: notes)

        do {
            try data.write(to: fileURL)
        } catch {
            print("Error")
        }
         */

    }

    func loadData() {

        if let loadedData: [String] = UserDefaults.standard.value(forKey: "notes") as? [String] {
            notes = loadedData
        }

        if let details: [String] = UserDefaults.standard.value(forKey: "details") as? [String] {
            noteDetails = details
        }

        table.reloadData()

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goDetails", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsView : DetailsViewController = segue.destination as! DetailsViewController
        selectedRow = table.indexPathForSelectedRow!.row
        detailsView.setDetail(a: noteDetails[selectedRow])
        detailsView.masterView = self
    }

}

