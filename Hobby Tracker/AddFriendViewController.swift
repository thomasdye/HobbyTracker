//
//  AddFriendViewController.swift
//  Hobby Tracker
//
//  Created by Casualty on 7/29/19.
//  Copyright © 2019 Thomas Dye. All rights reserved.
//

import UIKit

protocol AddFriendDelegate {
    func friendWasCreated(_ friend: Friend)
}

class AddFriendViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    @IBOutlet weak var hobbyOneTextField: UITextField!
    @IBOutlet weak var hobbyTwoTextField: UITextField!
    @IBOutlet weak var hobbyThreeTextField: UITextField!
    
    var delegate: AddFriendDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        
        guard let name = nameTextField.text,
            let hometown = hometownTextField.text,
            !name.isEmpty,
            !hometown.isEmpty else { return }
        
        var friend = Friend(name: name, hometown: hometown, hobbies: [])
        
        if let hobby1 = hobbyOneTextField.text, !hobby1.isEmpty {
            friend.hobbies.append(hobby1)
        }
        if let hobby2 = hobbyOneTextField.text, !hobby2.isEmpty {
            friend.hobbies.append(hobby2)
        }
        if let hobby3 = hobbyOneTextField.text, !hobby3.isEmpty {
            friend.hobbies.append(hobby3)
        }
        
        delegate?.friendWasCreated(friend)
        
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
    }
    
}


extension AddFriendViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case nameTextField:
                hometownTextField.becomeFirstResponder()
            case hometownTextField:
                hobbyOneTextField.becomeFirstResponder()
            case hobbyOneTextField:
                hobbyTwoTextField.becomeFirstResponder()
            case hobbyTwoTextField:
                hobbyThreeTextField.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        
        return false
    }
}
