//
//  AsteroidCell.swift
//  AsteroidApp
//
//  Created by Ceren Çiçek on 20.08.2021.
//

import UIKit

class AsteroidCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var lblIndex: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblVelocity: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        backView?.layer.cornerRadius = 15
        backView?.layer.shadowColor = UIColor.black.cgColor
        backView?.layer.shadowOpacity = 0.5
        backView?.layer.shadowOffset = .zero
        backView?.layer.shadowRadius = 10

        frontView?.layer.cornerRadius = 15
        frontView?.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
