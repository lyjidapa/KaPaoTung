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
    

    
    @IBOutlet weak var TopUp: UIView!
    @IBOutlet weak var Transfer: UIView!
    @IBOutlet weak var Bill: UIView!
    @IBOutlet weak var Favorite: UIView!
    @IBOutlet weak var History: UIView!
    @IBOutlet weak var withdrawn: UIView!
    
    //defining firebase reference var
    var refUsers: DatabaseReference!
    
    @IBOutlet weak var Withdraw: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TopUp.layer.cornerRadius = 20.0
        Transfer.layer.cornerRadius = 20.0
        Bill.layer.cornerRadius = 20.0
        Favorite.layer.cornerRadius = 20.0
        History.layer.cornerRadius = 20.0
        withdrawn.layer.cornerRadius = 20.0
        

        textFieldUsername.backgroundColor = UIColor.white;
        textFieldBalance.backgroundColor = UIColor.white;
        textFieldUsername.alpha = 0.5;
        textFieldBalance.alpha = 0.5;
        textFieldUsername.isUserInteractionEnabled = false;
        textFieldBalance.isUserInteractionEnabled = false;
        
        // Do any additional setup after loading the view, typically from a nib.

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


}



