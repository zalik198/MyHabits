//
//  HabitCollectionViewHeader.swift
//  MyHabits
//
//  Created by Shom on 05.04.2022.
//

import UIKit

class HabitCollectionViewHeader: UICollectionReusableView {
    
    lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.toAutoLayout()
        headerLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        headerLabel.textColor = .black
        headerLabel.text = "Сегодня"
        return headerLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(headerLabel)
        initialLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialLayout() {
        NSLayoutConstraint.activate([headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
                                     headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
                                     headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8)
                                    ])
    }
}


