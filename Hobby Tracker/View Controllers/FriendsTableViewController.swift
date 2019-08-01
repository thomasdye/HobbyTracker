//
//  FriendsTableViewController.swift
//  Hobby Tracker
//
//  Created by Casualty on 7/29/19.
//  Copyright © 2019 Thomas Dye. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var friends: [Friend] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddFriendModalSegue" {
            if let addFriendVC = segue.destination as? AddFriendViewController {
                addFriendVC.delegate = self
                
            }
            
        }
        
    }
    
}

// MARK: UITableViewDataSource
extension FriendsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Two main failure cases:
        //   1. Dequeue fails because identifier's don't match
        //   2. Failure to conditionally downcastt
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else  { return UITableViewCell() }
        
        let friend = friends[indexPath.row]
        cell.friend = friend
        
        return cell
    }
    
}


// FriendsTableViewController conforms to AddFriendDelegate protocol
    extension FriendsTableViewController: AddFriendDelegate {
        func friendWasCreated(_ friend: Friend) {
            friends.append(friend)
            dismiss(animated: true, completion: nil)
            tableView.reloadData()
        }
        
}
