//
//  FriendTableViewCell.swift
//  Hobby Tracker
//
//  Created by Casualty on 7/29/19.
//  Copyright © 2019 Thomas Dye. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var hometownLabel: UILabel!
    
    @IBOutlet weak var hobbyCountLabel: UILabel!
    
    var friend: Friend? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        
        guard let friend = friend else { return }
        
        nameLabel.text = friend.name
        hometownLabel.text = friend.hometown
        hobbyCountLabel.text = "\(friend.hobbies.count) hobbies"
        
    }
    
}
