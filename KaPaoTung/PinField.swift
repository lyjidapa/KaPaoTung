//
//  PinField.swift
//  KaPaoTung2
//
//  Created by Chitipat Thabsuwan on 25/8/2561 BE.
//  Copyright © 2561 Chitipat Thabsuwan. All rights reserved.
//

import UIKit

class PinField: UITextField {
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
    
    override func deleteBackward() {
        super.deleteBackward()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "deletePressed"), object: nil)
        // Enter your stuff here
    }
}
