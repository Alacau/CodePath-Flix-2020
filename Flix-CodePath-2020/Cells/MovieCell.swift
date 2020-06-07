//
//  MovieCell.swift
//  Flix-CodePath-2020
//
//  Created by Alan Cao on 6/6/20.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
