//
//  TasksVC.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/9/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import UIKit

class TasksVC: MABaseViewController {

   
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var project: Project?
    var displayedFile2: File2!  //tasks that i fetched
    var displayedFile4: File4!  //all tasks

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self ; tableView.dataSource  = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NormalProjectCell")
        
        if project != nil {
            titleLbl.text = "All \(project!.name) tasks"
            fetchTasks()
        } else {
            titleLbl.text = "All tasks"
            fetchAlltasks()
        }
    }
    
    func fetchAlltasks() {
        AllTasksServices.instance.fetchAllTasks(user: USERNAME, password: PASSWORD) { (success) in
            if success {
                self.displayedFile4 = AllTasksServices.instance.allTasks
                self.tableView.reloadData()
            }
        }
    }
    
    func fetchTasks() {
        TasksServices.instance.fetchProjects(user: USERNAME, password: PASSWORD,id: project!.id) { (success) in
            if success {
                self.displayedFile2 = TasksServices.instance.tasks
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func menuBtnTapped(_ sender: Any) {
        print("menu button Tapped")
    }
}

extension TasksVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if var cell = tableView.dequeueReusableCell(withIdentifier: "NormalProjectCell") as? UITableViewCell {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "NormalProjectCell")

            if project != nil {

            
                //cell.projectName.text = ProjectsServices.instance.projects.projects[indexPath.row].name
                cell.textLabel?.text = displayedFile2.tasklists[indexPath.row].name
                cell.detailTextLabel?.text = displayedFile2.tasklists[indexPath.row].projectName

            } else {
                cell.textLabel?.text = displayedFile4.todoItems[indexPath.row].todoListName
                cell.detailTextLabel?.text = displayedFile4.todoItems[indexPath.row].projectName

            }

            return cell
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if project != nil {
            return displayedFile2?.tasklists.count ?? 0
        } else {
            return displayedFile4?.todoItems.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
