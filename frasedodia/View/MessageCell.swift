//
//  MessageCell.swift
//  frasedodia
//
//  Created by Joao Barros on 20/06/22.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
