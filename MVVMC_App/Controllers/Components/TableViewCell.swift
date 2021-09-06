//
//  TableViewCell.swift
//  MVVMC_App
//
//  Created by Ondrej Kondek on 31/08/2021.
//

import UIKit

protocol TableViewCellDelegate {
    func updateContent(content: Status)
}

class TableViewCell: UITableViewCell {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var created: UILabel!
    @IBOutlet var statusText: UILabel!
    @IBOutlet var shareBtn: UIButton!

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        created.font = created.font.withSize(12)

        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 3
        if #available(iOS 13.0, *) {
            profileImage.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        } else {
            // Fallback on earlier versions
        }
        profileImage.contentMode = .scaleAspectFill
        profileImage.image = UIImage(named: "profile")
    }
}

extension TableViewCell: TableViewCellDelegate {
    func updateContent(content: Status) {
        name.text = content.name
        statusText.text = content.about
        let date = content.created
        created.text = date?.getStringFromDate()
    }
}
