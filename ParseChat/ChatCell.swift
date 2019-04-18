//
//  ChatCell.swift
//  ParseChat
//
//  Created by Wade Li on 4/13/19.
//  Copyright © 2019 Wade Li. All rights reserved.
//

import UIKit
import Parse
import MessageInputBar

class ChatCell: UITableViewCell {

    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var contextL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
