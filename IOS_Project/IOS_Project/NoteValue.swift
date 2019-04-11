//
//  NoteValue.swift
//  IOS_Project
//
//  Created by Yair Kasuker on 09/04/2019.
//  Copyright © 2019 Yair Kasuker. All rights reserved.
//

import UIKit

class NoteValue: UIViewController, UITextViewDelegate {
    
    weak var notesView: NotesView!
    var textView: UITextView!
    var btnSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        orderlyView()
    }
    
   private func orderlyView(){
        
        btnSave = UIButton(type: .system)
        btnSave.setTitle("Save", for: .normal)
        btnSave.frame = CGRect(x: 180 , y: 60, width: 50, height: 30)
        btnSave.setTitleColor(.orange, for: .normal)
        btnSave.titleLabel?.font = .systemFont(ofSize: 20)
        btnSave.addTarget(self, action: #selector(saveTheNote(sender:)), for: .touchUpInside)
        view.addSubview(btnSave)
    
    
        textView = UITextView(frame: CGRect(x: 0 , y: btnSave.frame.origin.y + 40, width: view.frame.width  , height: view.frame.height ))
        textView.text = "Enter your text here..."
        textView.textColor = UIColor.black
        textView.delegate = self
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.returnKeyType = .done
        view.addSubview(textView)
    
    }
    
    @objc func saveTheNote(sender: UIButton){
        notesView?.insertNewNote()
        self.dismiss(animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Enter your text here..."{
            textView.text = ""
            textView.textColor = UIColor.black
        }
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Wirte Somthing!"
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}
