//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Shom on 29.03.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    let addButton: UIButton = {
        let addButton = UIButton()
        
        return addButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    //MARK: add button in tabBar
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: nil)
        //navigationController?.navigationItem.titleView?.tintColor = UIColor(red: 161, green: 22, blue: 204, alpha: 1)
       


        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
