//
//  ProjectsVC.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/9/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import UIKit
import Lottie

class ProjectsVC: MABaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    var menuButton = LOTAnimationView()
    var menuDisplayed = false
    
    var displayedFiles1: File!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self ; tableView.dataSource  = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NormalProjectCell")
        
                
        fetchProjects()
    }

    func fetchProjects() {
        ProjectsServices.instance.fetchProjects(user: USERNAME, password: PASSWORD) { (success) in
            if success {
                self.displayedFiles1 = ProjectsServices.instance.projects
                self.tableView.reloadData()
            }
        }
    }

}

extension ProjectsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NormalProjectCell") as? UITableViewCell {
            
            //cell.projectName.text = ProjectsServices.instance.projects.projects[indexPath.row].name
            cell.textLabel?.text = displayedFiles1.projects[indexPath.row].name
            cell.imageView?.image = #imageLiteral(resourceName: "empty-heart")
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedFiles1?.projects.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //let dvc = storyboard?.instantiateViewController(withIdentifier: "TasksVC") as! TasksVC
        //dvc.project = ProjectsServices.instance.projects.projects[indexPath.row]
        //present(dvc, animated: true, completion: nil)
        
        let dvc = storyboard?.instantiateViewController(withIdentifier: "TasksVC") as! TasksVC
        dvc.project = displayedFiles1.projects[indexPath.row]
        presentSentFrontViewController(dvc)
        
    }
}
