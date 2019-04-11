//
//  ViewController.swift
//  IOS_Project
//
//  Created by Yair Kasuker on 28/03/2019.
//  Copyright © 2019 Yair Kasuker. All rights reserved.
//

import UIKit

var score:String!

class ViewController: UIViewController, UITextFieldDelegate{

    var password:UITextField!
    var userName:UITextField!
    
    var nameOfApp:UILabel!
    var lblInfo:UILabel!
    
    var btnLogin:UIButton!
    var btnSignIn:UIButton!
    
    var notesView: NotesView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderlyView()
    }
    
    private func orderlyView(){
        
        //the user name , define your user what ever you choosen
        password = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        password.borderStyle = .roundedRect
        password.center = view.center
        password.placeholder = "Enter Password..."
        password.delegate = self
        view.addSubview(password)
        
        //enter the pass that belong to the user.
        userName = UITextField(frame: CGRect(x: password.frame.origin.x , y: password.frame.origin.y - 100, width: password.frame.width, height: password.frame.height))
        userName.borderStyle = .roundedRect
        userName.placeholder = "Enter User Name..."
        userName.delegate = self
        view.addSubview(userName)
        
        //the name of the game Not Change!
        nameOfApp = UILabel(frame: CGRect(x: password.frame.origin.x - 25 , y: password.frame.origin.y - 200, width: password.frame.width + 50 , height: password.frame.height))
        nameOfApp.text = "Remainder App"
        nameOfApp.textAlignment = .center
        nameOfApp.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(nameOfApp)
        
        //the score of the player when you win or lose a game, showen after the game finished.
        lblInfo = UILabel(frame: CGRect(x: password.frame.origin.x - 25 , y: password.frame.origin.y + 150, width: password.frame.width + 50 , height: password.frame.height - 10))
        lblInfo.textAlignment = .center
        lblInfo.font = UIFont.boldSystemFont(ofSize: 21)
        lblInfo.textColor = UIColor(hue: 0.0222, saturation: 1, brightness: 0.64, alpha: 1.0)
        view.addSubview(lblInfo)
        
        //click to start your game, after the first game only the second button will appear
        btnLogin = UIButton(type: .system)
        btnLogin.frame = CGRect(x: password.frame.origin.x, y: password.frame.origin.y + 50, width: password.frame.width , height: password.frame.height)
        btnLogin.setTitle("LogIn", for: .normal)
        btnLogin.titleLabel?.font = .systemFont(ofSize: 20)
        btnLogin.setTitleColor(.black, for: .normal)
        btnLogin.addTarget(self, action: #selector(afterChoose(sender:)), for: .touchUpInside)
        view.addSubview(btnLogin)
        
        //the sencond that will alloud to used after the game will be finished
        btnSignIn = UIButton(type: .system)
        btnSignIn.frame = CGRect(x: password.frame.origin.x, y: password.frame.origin.y + 100, width: password.frame.width , height: password.frame.height)
        btnSignIn.setTitle("SignIn", for: .normal)
        btnSignIn.titleLabel?.font = .systemFont(ofSize: 20)
        btnSignIn.setTitleColor(.black, for: .normal)
        view.addSubview(btnSignIn)
        
    }
    
    @objc func afterChoose(sender:UIButton){
        
        if (userName.text == "Yair" && password.text == "1234"){
            goToSecondView()
            notesView?.scoLable.text = "Welcome, \(userName.text!)"
        }else{
            lblInfo.text = "Wrong Pass or UserName"
        }
            
    }
    
    func goToSecondView(){
        if(self.notesView == nil){
            self.notesView = NotesView()
        }
        self.notesView!.mainViewController = nil
        self.present(notesView!, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}

