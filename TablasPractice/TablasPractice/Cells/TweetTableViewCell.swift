//
//  TweetTableViewCell.swift
//  TablasPractice
//
//  Created by José Francisco Castillo Rodríguez on 08/10/21.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    //MARK: REferencias a UI
    @IBOutlet weak var userImageView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupCell(username: String, message: String){
        usernameLabel.text = username
        messageLabel.text = message
    }
    
}
