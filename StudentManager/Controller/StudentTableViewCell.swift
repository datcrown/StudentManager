//
//  StudentTableViewCell.swift
//  StudentManager
//
//  Created by Quốc Đạt on 22.08.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
  
    @IBOutlet weak var studentImageView: UIImageView!
    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var IDNameTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
