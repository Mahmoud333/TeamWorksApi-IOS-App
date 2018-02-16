//
//  ActivityVC.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/11/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import UIKit
import Lottie

class ActivityVC: MABaseViewController {
    

    @IBOutlet weak var titleLbl: UILabel!

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var displayedFile3: File3!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self ; tableView.dataSource  = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NormalProjectCell")
        
        //Fetch
        fetchActivitys()
        

    }

    
    func fetchActivitys() {
        RecentActivityServices.instance.fetchActivityServices { (success) in
            if success {
                self.displayedFile3 = RecentActivityServices.instance.recentActivity
                self.tableView.reloadData()
                
            }
        }
    }
    

}

extension ActivityVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if var cell = tableView.dequeueReusableCell(withIdentifier: "NormalProjectCell") as? UITableViewCell {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "NormalProjectCell")
            
            
            cell.textLabel?.text = displayedFile3.activity[indexPath.row].description
            cell.detailTextLabel?.text = displayedFile3.activity[indexPath.row].projectName
            cell.imageView?.image = #imageLiteral(resourceName: "empty-heart")
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedFile3?.activity.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
