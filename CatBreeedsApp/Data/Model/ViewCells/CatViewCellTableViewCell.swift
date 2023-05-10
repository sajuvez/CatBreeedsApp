//
//  CatViewCellTableViewCell.swift
//  CatBreeedsApp
//
//  Created by MacBook Pro on 10/05/23.
//

import UIKit

class CatViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
