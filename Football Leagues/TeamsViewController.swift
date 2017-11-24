//
//  TeamsViewController.swift
//  Football Leagues
//
//  Created by Mohammad Shaker on 11/24/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var noOfGamesLbl: UILabel!
    @IBOutlet weak var noOfTeamsLbl: UILabel!
    
    var league: League! = League()
    var viewModel: TeamsViewModel! = TeamsViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.league = self.league
        
        self.tableView.tableFooterView = UIView()
        self.title = viewModel.titleToDisplay()
        self.titleLbl.text = viewModel.titleToDisplay()
        self.noOfGamesLbl.text = viewModel.noOfGamesToDisplay()
        self.noOfTeamsLbl.text = viewModel.noOfTeamsToDisplay()
        
        viewModel.loadAllTeams(forLeague: league, completion: {
            self.tableView.reloadData()
        })
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
        
        return cell
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

