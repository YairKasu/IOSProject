//
//  GameView.swift
//  IOS_Project
//
//  Created by Yair Kasuker on 06/04/2019.
//  Copyright © 2019 Yair Kasuker. All rights reserved.
//

import UIKit


class NotesView: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    weak var mainViewController: ViewController!
    var scoLable:UILabel!
    var plusBtn:UIButton!
    var tableView:UITableView!
    var textField:UITextField!
    
    var alertController: UIAlertController?
    var indexValue = -1
    
    var notes:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderlyView()
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("You are now in NotesView.swift")
    }
    
    private func orderlyView() {
        view.backgroundColor = UIColor.lightGray
        
        scoLable = UILabel(frame: CGRect(x: 30 , y: 80, width: 150, height: 40))
        scoLable.text = ""
        scoLable.font = UIFont.boldSystemFont(ofSize: 20)
        scoLable.textAlignment = .center
        view.addSubview(scoLable)
        
        plusBtn = UIButton(type: .contactAdd)
        plusBtn.frame = CGRect(x: scoLable.frame.origin.x + 320 , y: scoLable.frame.origin.y + 5, width: scoLable.frame.width - 125, height: scoLable.frame.height - 10)
        plusBtn.setTitleColor(.black, for: .normal)
        plusBtn.backgroundRect(forBounds: .infinite)
        plusBtn.addTarget(self, action: #selector(addNote(sender:)), for: .touchUpInside)
        view.addSubview(plusBtn)
        
        tableView = UITableView(frame: CGRect(x: 0, y: scoLable.frame.origin.y + 100, width: view.frame.width, height: view.frame.height))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "identifier")
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        
        textField = UITextField(frame: CGRect(x: 0, y: scoLable.frame.origin.y + 50, width: view.frame.width, height: 40))
        textField.placeholder = "Note Here..."
        textField.delegate = self
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
        
    }
    
    @objc func addNote(sender: UIButton){
        insertNewNote()
    }
    
    func insertNewNote(){
        notes.append(textField.text!)
        let indexPath = IndexPath(row: notes.count - 1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .middle)
        tableView.endUpdates()
        textField.text = ""
        view.endEditing(true)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        cell.textLabel!.text = notes[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        notes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if alertController == nil {
            alertController = UIAlertController(title: "Edit", message: "Make Changes:", preferredStyle: .alert)
            alertController?.addTextField(configurationHandler: nil)
            let action = UIAlertAction(title: "Save", style: .default) { (action: UIAlertAction) in
                let string = self.alertController!.textFields![0].text!
                if !string.isEmpty{
                    self.notes[self.indexValue] = string
                    self.tableView.reloadData()
                }
            }
            alertController!.addAction(action)
        }
        self.indexValue = indexPath.row
        alertController!.textFields![0].text = notes[self.indexValue]
        present(alertController!, animated: true, completion: nil)
    }
}
