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
    
    //defining firebase reference var
    var refUsers: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //FirebaseApp.configure()
        refUsers = Database.database().reference().child("Users");
        textFieldUsername.backgroundColor = UIColor.white;
        textFieldUsername.alpha = 0.5;
        textFieldUsername.isUserInteractionEnabled = false;
        textFieldBalance.backgroundColor = UIColor.white;
        textFieldBalance.alpha = 0.5;
        textFieldBalance.isUserInteractionEnabled = false;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


