//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Meltem Uğurlu on 24.05.2023.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
       let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = "Banana"
        parseObject["calories"] = 150
        parseObject.saveInBackground{(success, error) in
            if error != nil{
                print(error?.localizedDescription)
            }else{
                print("uploaded")
            }
        }
        let query = PFQuery(className: "Fruits")
        query.findObjectsInBackground{(objects, error) in
            
            if error != nil{
                print(error?.localizedDescription)
            }else{
                print(objects)
            }
        }*/
        
        
    }
    
    
    @IBAction func signInClicked(_ sender: Any) {
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if userNameText.text != "" && passwordText.text != ""{
            
            let user = PFUser()
            user.username = userNameText.text!
            user.password = passwordText.text!
            
            user.signUpInBackground{( success, error) in
                if error != nil{
                    self.makeAlert(titleInput: "Error !", messageInput: error?.localizedDescription ?? "Error !!")
                    
                }else{
                    //when user sing up , to go which page so perform segue
                    print("OKKKK")
                    
                }
                
            }
        
            
        
        }else{
            makeAlert(titleInput: "Error !", messageInput: "Username/Password ?")
        }
        
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        
        let alert = UIAlertController(title:titleInput , message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
        
    }
    

}

