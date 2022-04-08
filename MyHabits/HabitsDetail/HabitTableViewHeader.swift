//
//  HabitTableViewHeader.swift
//  MyHabits
//
//  Created by Shom on 08.04.2022.
//

import UIKit

class HabitTableViewHeader: UITableViewHeaderFooterView {
    
    let labelActive: UILabel = {
        let labelActive = UILabel()
        labelActive.toAutoLayout()
        labelActive.text = "АКТИВНОСТЬ"
        labelActive.textAlignment = .left
        labelActive.textColor = .black
        labelActive.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        labelActive.textColor = UIColor(red: 0.24, green: 0.24, blue: 0.26, alpha: 0.60)
        
        return labelActive
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(labelActive)
        initialLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initialLayout() {
        NSLayoutConstraint.activate([labelActive.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
                                     labelActive.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                     labelActive.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
                                    ])
    }
    
    
    
}
