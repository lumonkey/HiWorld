//
//  MessageCell.swift
//  ParseChat
//
//  Created by Wade Li on 4/17/19.
//  Copyright © 2019 Wade Li. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var usernameL: UILabel!
    @IBOutlet weak var chatL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
