//
//  LeaguesTableViewController.swift
//  Football Leagues
//
//  Created by Mohammad Shaker on 11/24/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit

class LeaguesTableViewController: UITableViewController {

    var viewModel: LeaguesViewModel! = LeaguesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        
        viewModel.loadAllLeagues {
            self.tableView.reloadData()
        }
    }

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsToDisplay(in: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as! LeagueCell

        cell.titleLbl.text = viewModel.titleToDisplay(for: indexPath)
        cell.noOfGamesLbl.text = viewModel.noOfGamesToDisplay(for: indexPath)
        cell.noOfTeamsLbl.text = viewModel.noOfTeamsToDisplay(for: indexPath)

        return cell
    }

    
    // MARK: - Table view data source
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToTeamsSegue" {
            let vc = segue.destination as! TeamsViewController
            vc.league = viewModel.league(for: self.tableView.indexPathForSelectedRow!)
        }
    }
}
