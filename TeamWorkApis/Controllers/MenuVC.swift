//
//  MenuVC.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/11/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var profileImageV: UIImageView!
    
    @IBOutlet weak var companyTitleLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    
    
    var sections = ["Activiy", "All Projects", "All Tasks"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self; tableView.dataSource = self
        
        //displayed width of the menu
        self.revealViewController().rearViewRevealWidth = self.view.frame.width * 0.7//- 60
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NormalCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let MAVC = self.revealViewController().frontViewController.superclass as? MABaseViewController {
            MAVC.menuLtiBtn.animateTapped()
        }
    }
    
}

extension MenuVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if var cell = tableView.dequeueReusableCell(withIdentifier: "NormalCell") as? UITableViewCell {
            
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "NormalCell")
            
            cell.textLabel?.text = sections[indexPath.row]
            
            //Customize Cell
            cell.textLabel?.font = UIFont(name: "AvenirNext-Medium", size: 20)
            cell.backgroundColor = UIColor(white: 0.3, alpha: 0.4)
            cell.textLabel?.textColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) //UIColor.white
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        switch indexPath.row {
        case 0:
            self.revealViewController().revealToggle(animated: true)
            let dvc = storyboard?.instantiateViewController(withIdentifier: "ActivityVC") as! ActivityVC
            self.revealViewController().setFront(dvc, animated: true)
        case 1:
            self.revealViewController().revealToggle(animated: true)
            let dvc = storyboard?.instantiateViewController(withIdentifier: "ProjectsVC") as! ProjectsVC
            self.revealViewController().setFront(dvc, animated: true)
        case 2:
            self.revealViewController().revealToggle(animated: true)
            let dvc = storyboard?.instantiateViewController(withIdentifier: "TasksVC") as! TasksVC
            self.revealViewController().setFront(dvc, animated: true)
        
        default:
            break
        }
        

        
    }
}
