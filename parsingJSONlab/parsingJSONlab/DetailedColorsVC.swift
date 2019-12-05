//
//  DetailedColorsVC.swift
//  parsingJSONlab
//
//  Created by David Lin on 12/3/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class DetailedColorsVC: UIViewController {
    var detailedColors: Color!
    
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var rgbLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData() {
        hexLabel.text = "Hex Value: \(detailedColors.hex["clean"] ?? "00000" )"
        rgbLabel.text = "RGB VALUE: Red \(detailedColors.rgb.r) Green \(detailedColors.rgb.g) Blue \(detailedColors.rgb.b)"
    }
}
