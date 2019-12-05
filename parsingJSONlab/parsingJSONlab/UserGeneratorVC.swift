//
//  UserGeneratorVC.swift
//  parsingJSONlab
//
//  Created by David Lin on 11/27/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class UserGeneratorVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var users = [RandomUsers]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    
    func loadData() {
        users = RandomUserData.getUsers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailUsers = segue.destination as? DetailedUserGeneratorVC, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError()
        }
        detailUsers.detailedUsers = users[indexPath.row]
    }
}

extension UserGeneratorVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = "\(user.name.first) \(user.name.last)"
        cell.detailTextLabel?.text = user.email
        return cell
    }
}
