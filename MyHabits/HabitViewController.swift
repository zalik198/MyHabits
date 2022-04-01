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
        //pickerButton.frame.size = CGSize(width: 30, height: 30)
        pickerButton.layer.cornerRadius = 15
        pickerButton.backgroundColor = UIColor(red: 1.00, green: 0.62, blue: 0.31, alpha: 1.00)
        pickerButton.clipsToBounds = true
        pickerButton.addTarget(self, action: #selector(pickerTap), for: .touchUpInside)
        
        return pickerButton
    }()
    
    let hourLabel: UILabel = {
        let hourLabel = UILabel()
        hourLabel.toAutoLayout()
        hourLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        hourLabel.text = "ВРЕМЯ"
        return hourLabel
    }()
    
    let selectHour: UILabel = {
        let selectHour = UILabel()
        selectHour.toAutoLayout()
        selectHour.font = .systemFont(ofSize: 17)
        selectHour.text = "Каждый день в "
        return selectHour
    }()
    
    let hourPicker: UIDatePicker = {
        let hourPicker = UIDatePicker()
        hourPicker.toAutoLayout()
        hourPicker.datePickerMode = .time
        hourPicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        
        return hourPicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: nil)
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        scrollView.addSubviews(headlineLabel, habitTextField, colorLabel, pickerButton, hourLabel, selectHour, hourPicker)
        
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
                                     
                                     hourLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 153),
                                     hourLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
                                     hourLabel.heightAnchor.constraint(equalToConstant: 18),
                                     hourLabel.widthAnchor.constraint(equalToConstant: 47),
                                     
                                     selectHour.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 178),
                                     selectHour.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
                                     selectHour.heightAnchor.constraint(equalToConstant: 22),
                                     selectHour.widthAnchor.constraint(equalToConstant: 194),
                                     
                                     hourPicker.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 215),
                                     hourPicker.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     hourPicker.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     hourPicker.heightAnchor.constraint(equalToConstant: 216),
                                     hourPicker.widthAnchor.constraint(equalToConstant: scrollView.contentSize.width)
                                     
                                     
                                    ])
    }
    
    //MARK: target image button
    @objc func pickerTap() {
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        //colorPickerVC.isModalInPresentation = true
        present(colorPickerVC, animated: true)
       
        
      
    }
    
    
}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        pickerButton.backgroundColor = color

    }

}

