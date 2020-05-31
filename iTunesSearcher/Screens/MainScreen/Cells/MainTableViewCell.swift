//
//  MainTableViewCell.swift
//  iTunesSearcher
//
//  Created by Boris Sortino on 31/05/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    private var viewModel: MainModels.CellViewModel? {
        didSet {
            titleLabel?.text = viewModel?.title
            artistLabel?.text = viewModel?.artist
        }
    }
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var artistLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        titleLabel?.text = nil
        artistLabel?.text = nil
    }

}
