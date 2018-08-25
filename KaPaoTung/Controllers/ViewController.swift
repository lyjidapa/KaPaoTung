//
//  ViewController.swift
//  KaPaoTung
//
//  Created by Jidapa Kongsakoonwong on 24/8/2561 BE.
//  Copyright © 2561 Jidapa Kongsakoonwong. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    //components on Main UI
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldBalance: UITextField!
    @IBOutlet weak var imgViewSetting: UIImageView!
    @IBOutlet weak var imgViewEyehide: UIImageView!
    @IBOutlet weak var imgViewTopup: UIImageView!
    @IBOutlet weak var imgViewTransfer: UIImageView!
    @IBOutlet weak var imgViewPaybill: UIImageView!
    @IBOutlet weak var imgViewWithdraw: UIImageView!
    @IBOutlet weak var imgViewFavorite: UIImageView!
    @IBOutlet weak var imgViewTransaction: UIImageView!
    
    @IBOutlet weak var tf1: PinField!
    @IBOutlet weak var tf2: PinField!
    @IBOutlet weak var tf3: PinField!
    @IBOutlet weak var tf4: PinField!
    @IBOutlet weak var tf5: PinField!
    @IBOutlet weak var tf6: PinField!
    
    //defining firebase reference var
    var refUsers: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldUsername.backgroundColor = UIColor.white;
        textFieldBalance.backgroundColor = UIColor.white;
        textFieldUsername.alpha = 0.5;
        textFieldBalance.alpha = 0.5;
        textFieldUsername.isUserInteractionEnabled = false;
        textFieldBalance.isUserInteractionEnabled = false;
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Do any additional setup after loading the view, typically from a nib.
        tf1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf5.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf6.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        
        NotificationCenter.default.addObserver(self, selector: #selector(goPrevious), name: NSNotification.Name(rawValue: "deletePressed"), object: nil)
        //defining firebase reference var
        let rootRef = Database.database().reference()
        let usersRef = rootRef.child("Users")
        let currentUser = usersRef.child("Somchai")
        
        currentUser.observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let balanceTemp = value?["balance"] as! Int
            self.textFieldBalance.text = String(balanceTemp)
            self.textFieldUsername.text = "Somchai"
        })
        //let testAdd : NSDictionary = ["balance" : 300 as Int, "test" : "testAdd"]
        //usersRef.setValue(testAdd)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tf1.becomeFirstResponder()
    }
    
    @objc func goPrevious() {
        
        if tf2.isFirstResponder {
            tf1.isUserInteractionEnabled = true
            tf1.becomeFirstResponder()
        } else if tf3.isFirstResponder {
            tf2.isUserInteractionEnabled = true
            tf2.becomeFirstResponder()
        } else if tf4.isFirstResponder {
            tf3.isUserInteractionEnabled = true
            tf3.becomeFirstResponder()
        } else if tf5.isFirstResponder {
            tf4.isUserInteractionEnabled = true
            tf4.becomeFirstResponder()
        } else if tf6.isFirstResponder {
            tf5.isUserInteractionEnabled = true
            tf5.becomeFirstResponder()
        }
        
    }
    
    @objc func textFieldDidChange(textField: PinField){
        let text = textField.text
        print(textField)
        if text?.utf16.count == 1 {
            switch textField{
            case tf1:
                tf2.becomeFirstResponder()
                tf1.isUserInteractionEnabled = false
            case tf2:
                tf3.becomeFirstResponder()
                tf2.isUserInteractionEnabled = false
            case tf3:
                tf4.becomeFirstResponder()
                tf3.isUserInteractionEnabled = false
            case tf4:
                tf5.becomeFirstResponder()
                tf4.isUserInteractionEnabled = false
            case tf5:
                tf6.becomeFirstResponder()
                tf5.isUserInteractionEnabled = false
            case tf6:
                tf6.resignFirstResponder()
                tf6.isUserInteractionEnabled = false
            default:
                break
            }
        } else {
            
        }

}


}
