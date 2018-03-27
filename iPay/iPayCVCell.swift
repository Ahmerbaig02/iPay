//
//  iPayCVCell.swift
//  iPay
//
//  Created by Mahnoor Fatima on 3/27/18.
//  Copyright © 2018 Mahnoor Fatima. All rights reserved.
//

import UIKit

class iPayCVCell: UICollectionViewCell {
    
    @IBOutlet weak var ticketImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 3
    }
    
}
