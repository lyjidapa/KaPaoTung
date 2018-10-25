//
//  User.swift
//  KaPaoTung
//
//  Created by Patipon Suwanbol on 25/8/2561 BE.
//  Copyright © 2561 Jidapa Kongsakoonwong. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    var balance: Int!
    
    var getBalance: Int {
        return balance
    }
    
    // Standard init
    init(balance: Int) {
        self.balance = balance
    }
    
    // Init for reading from Database snapshot
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        balance = snapshotValue["balance"] as! Int
    }
    
    // Func converting model for easier writing to database
    func toAnyObject() -> Any {
        return [
            "balance": balance,
        ]
    }
}

