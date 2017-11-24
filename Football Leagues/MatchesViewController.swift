//
//  MatchesViewController.swift
//  Football Leagues
//
//  Created by Mohammad Shaker on 11/24/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit

class MatchesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLbl: UILabel!
    
    var viewModel: MatchesViewModel! = MatchesViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        self.title = viewModel.titleToDisplay()
        self.titleLbl.text = viewModel.titleToDisplay()
        
        viewModel.loadAllMatches {
            self.tableView.reloadData()
        }
    }

}



extension MatchesViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfMatchesToDisplay(in: section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isMatchFinished(for: indexPath) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MatchResultCell", for: indexPath) as! MatchResultCell
            cell.dateLbl.text = viewModel.matchDateToDisplay(for: indexPath)
            cell.resultLbl.text = viewModel.matchResultToDisplay(for: indexPath)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchScheduledCell", for: indexPath) as! MatchScheduledCell
        cell.dateLbl.text = viewModel.matchDateToDisplay(for: indexPath)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Games"
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
