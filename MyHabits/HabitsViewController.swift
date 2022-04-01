//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Shom on 29.03.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    var habitVC = HabitViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        

    //MARK: add button in tabBar
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(buttonTap))

    
    }

    @objc func buttonTap() {
        habitVC.navigationItem.title = "Создать"
        self.navigationController?.pushViewController(habitVC, animated: true)
    }

}
