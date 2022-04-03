//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Shom on 31.03.2022.
//

import UIKit

class HabitViewController: UIViewController {
    
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        scrollView.indicatorStyle = .black
        return scrollView
    }()
    
    let headlineLabel: UILabel = {
        let headlineLabel = UILabel()
        headlineLabel.toAutoLayout()
        headlineLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        headlineLabel.text = "НАЗВАНИЕ"
        return headlineLabel
    }()
    
    let habitTextField: UITextField = {
        let habitTextField = UITextField()
        habitTextField.toAutoLayout()
        habitTextField.font = .systemFont(ofSize: 17, weight: .regular)
        habitTextField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        return habitTextField
    }()
    
    
    let colorLabel: UILabel = {
        let colorLabel = UILabel()
        colorLabel.toAutoLayout()
        colorLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        colorLabel.text = "ЦВЕТ"
        return colorLabel
    }()
    
    let pickerButton: UIButton = {
        let pickerButton = UIButton()
        pickerButton.toAutoLayout()
        pickerButton.layer.cornerRadius = 15
        pickerButton.backgroundColor = UIColor(red: 1.00, green: 0.62, blue: 0.31, alpha: 1.00)
        pickerButton.clipsToBounds = true
        pickerButton.addTarget(self, action: #selector(pickerTap), for: .touchUpInside)
        return pickerButton
    }()
    
    let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.toAutoLayout()
        dateLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        dateLabel.text = "ВРЕМЯ"
        return dateLabel
    }()
    
    let selectDate: UILabel = {
        let selectDate = UILabel()
        selectDate.toAutoLayout()
        selectDate.font = .systemFont(ofSize: 17)
        selectDate.text = "Каждый день в "
        return selectDate
    }()
    
    var date: Date = Date() {
        didSet {
            let dateformat = DateFormatter()
            dateformat.dateFormat = "HH:mm a"
            dateValueLabel.text = dateformat.string(from: date)
        }
    }
    
    lazy var dateValueLabel: UILabel = {
        let dateValueLabel = UILabel()
        dateValueLabel.toAutoLayout()
        dateValueLabel.font = .systemFont(ofSize: 17, weight: .regular)
        dateValueLabel.numberOfLines = 1
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "HH:mm a"
        dateValueLabel.textColor = UIColor(red: 0.63, green: 0.09, blue: 0.80, alpha: 1.00)
        dateValueLabel.text = dateFormat.string(from: date)
        return dateValueLabel
    }()
    
  
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.toAutoLayout()
        datePicker.date = date
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        //datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.addTarget(self, action: #selector(datePickerTap), for: .valueChanged)
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveHabit))
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        scrollView.addSubviews(headlineLabel, habitTextField, colorLabel, pickerButton, dateLabel, selectDate, dateValueLabel, datePicker)
        
        initialLayout()

    }
    

    //MARK: Initial Layout
    func initialLayout() {
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     
                                     headlineLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 21),
                                     headlineLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
                                     headlineLabel.heightAnchor.constraint(equalToConstant: 18),
                                     headlineLabel.widthAnchor.constraint(equalToConstant: 74),
                                     
                                     habitTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 46),
                                     habitTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
                                     habitTextField.heightAnchor.constraint(equalToConstant: 22),
                                     habitTextField.widthAnchor.constraint(equalToConstant: 295),
                                     
                                     colorLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 83),
                                     colorLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
                                     colorLabel.heightAnchor.constraint(equalToConstant: 18),
                                     colorLabel.widthAnchor.constraint(equalToConstant: 36),
                                     
                                     pickerButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 108),
                                     pickerButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
                                     pickerButton.heightAnchor.constraint(equalToConstant: 30),
                                     pickerButton.widthAnchor.constraint(equalToConstant: 30),
                                     
                                     dateLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 153),
                                     dateLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
                                     dateLabel.heightAnchor.constraint(equalToConstant: 18),
                                     dateLabel.widthAnchor.constraint(equalToConstant: 47),
                                     
                                     selectDate.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 178),
                                     selectDate.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
                                     selectDate.heightAnchor.constraint(equalToConstant: 22),
                                     
                                     dateValueLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 178),
                                     dateValueLabel.leadingAnchor.constraint(equalTo: selectDate.trailingAnchor),
                                     dateValueLabel.heightAnchor.constraint(equalToConstant: 22),
                                     
                                     
                                     datePicker.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 215),
                                     datePicker.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     datePicker.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     datePicker.heightAnchor.constraint(equalToConstant: 216),
                                     datePicker.widthAnchor.constraint(equalToConstant: scrollView.contentSize.width)
                                     
                                    ])
    }
    
    //MARK: target image button
    @objc func pickerTap() {
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        colorPickerVC.selectedColor = pickerButton.backgroundColor!
        present(colorPickerVC, animated: true)
    }
    
    @objc func datePickerTap( _ sender: UIDatePicker) {
        date = sender.date
    }
    
    @objc func saveHabit() {
        
        self.navigationController?.popViewController(animated: true)

    }
    
}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        pickerButton.backgroundColor = color
    }
}

