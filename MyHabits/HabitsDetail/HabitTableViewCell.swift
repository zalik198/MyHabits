//
//  HabitTableViewCell.swift
//  MyHabits
//
//  Created by Shom on 08.04.2022.
//

import UIKit

class HabitTableViewCell: UITableViewCell {

    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.toAutoLayout()
        dateLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return dateLabel
    }()
    
    lazy var checkmarkLabel: UILabel = {
        let checkmarkLabel = UILabel()
        checkmarkLabel.toAutoLayout()
        checkmarkLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        checkmarkLabel.textColor = constPurpleColor
        checkmarkLabel.text = "✓"
        return checkmarkLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         
         contentView.addSubviews(dateLabel, checkmarkLabel)
         initialLayout()
         
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initialLayout() {
        NSLayoutConstraint.activate([dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
                                     dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                     dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11),
                                     checkmarkLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
                                     checkmarkLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
                                     checkmarkLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11)

            
                                    ])
    }
    
    func initialEdit(date: Date, check: Bool) {
        
        let today = Calendar.current.dateComponents([.day], from: Date())
        let activDay = Calendar.current.dateComponents([.day], from: date)
        
        if let day = today.day {
            if day == activDay.day {
                dateLabel.text = "Сегодня"
            } else if day - 1 == activDay.day {
                dateLabel.text = "Вчера"
            } else {
                let dateformat = DateFormatter()
                dateformat.locale = Locale(identifier: "ru_RU")
                dateformat.dateFormat = "dd MMMM yyyy"
                dateLabel.text = dateformat.string(from: date)
            }
        }
        checkmarkLabel.isHidden = !check
    }
}
