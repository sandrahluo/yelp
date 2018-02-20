//
//  BusinessCell.swift
//  Yelp
//
//  Created by Sandra Luo on 2/13/18.
//  Copyright © 2018 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var reviewCountsLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var business: Business! {
        // observer that will update the label whenever it changes
        didSet {
            nameLabel.text = business.name
            thumbImageView.setImageWith(business.imageURL!)
            categoriesLabel.text = business.categories
            addressLabel.text = business.address
            // encapsulating a variable in a string
            reviewCountsLabel.text = "\(business.reviewCount!) Reviews"
            distanceLabel.text = business.distance
            ratingImageView.setImageWith(business.ratingImageURL!)
        }
    }
    // function that gets called when the cell is instantiated
    override func awakeFromNib() {
        super.awakeFromNib()
        // round the image of the business in tableView
        thumbImageView.layer.cornerRadius = 3
        thumbImageView.clipsToBounds = true
        // the size of the label in IB is the largest we want it to be so wrap the content accordinglt
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // reevaluate this when the parent changes dimension (e.g. screen rotation)
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
