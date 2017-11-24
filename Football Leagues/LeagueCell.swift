//
//  LeagueCell.swift
//  Football Leagues
//
//  Created by Mohammad Shaker on 11/24/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit

class LeagueCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var noOfGamesLbl: UILabel!
    @IBOutlet weak var noOfTeamsLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
