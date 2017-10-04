//
//  CommentsTableViewCell.swift
//  basic_iOS
//
//  Created by Ayrus Aszer on 10/5/17.
//  Copyright © 2017 Resza. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var namaComments: UILabel!
    @IBOutlet weak var emailComments: UILabel!
    @IBOutlet weak var bodyComments: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
