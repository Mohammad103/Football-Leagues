//
//  MatchResultCell.swift
//  Football Leagues
//
//  Created by Mohammad Shaker on 11/24/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit

class MatchResultCell: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
