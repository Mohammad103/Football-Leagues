//
//  TeamsViewController.swift
//  Football Leagues
//
//  Created by Mohammad Shaker on 11/24/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit
import SDWebImage

class TeamsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var noOfGamesLbl: UILabel!
    @IBOutlet weak var noOfTeamsLbl: UILabel!
    
    var viewModel: TeamsViewModel! = TeamsViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        self.title = viewModel.titleToDisplay()
        self.titleLbl.text = viewModel.titleToDisplay()
        self.noOfGamesLbl.text = viewModel.noOfGamesToDisplay()
        self.noOfTeamsLbl.text = viewModel.noOfTeamsToDisplay()
        
        viewModel.loadAllTeams {
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToMatchesSegue" {
            let vc = segue.destination as! MatchesViewController
            vc.viewModel.team = viewModel.team(for: self.tableView.indexPathForSelectedRow!)
        }
    }
}


extension TeamsViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfTeamsToDisplay(in: section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as! TeamCell
        
        cell.titleLbl.text = viewModel.teamNameToDisplay(for: indexPath)
        cell.logoImageView.sd_setImage(with: URL(string: viewModel.teamLogoUrl(for: indexPath)), placeholderImage: UIImage(named: "placeholder"))
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Teams"
        }
        return ""
    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 30.0
        }
        return 0.0
    }
}

