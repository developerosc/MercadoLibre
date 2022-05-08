//
//  ItemsTableViewCell.swift
//  Mercadolibre
//
//  Created by Asesoftware on 8/05/22.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbItemTable: UILabel!
    @IBOutlet weak var lbImageTable: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
