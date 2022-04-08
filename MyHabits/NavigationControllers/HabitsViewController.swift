//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Shom on 29.03.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    var habitVC = HabitViewController()
    
    static let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 12
        layout.sectionInsetReference = .fromContentInset
        
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return layout
    }()
    
    static let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.toAutoLayout()
        collectionView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: add button in tabBar
        navigationController?.navigationBar.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(buttonTap))
  
        
        HabitsViewController.collectionView.dataSource = self
        HabitsViewController.collectionView.delegate = self
        
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        
        view.addSubview(HabitsViewController.collectionView)
        
        HabitsViewController.collectionView.register(HabitProgressViewCell.self, forCellWithReuseIdentifier: "habitProgress")
        HabitsViewController.collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: "habitViewCell")
        
        initialLayout()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Сегодня"

    }
    
    func initialLayout() {
        NSLayoutConstraint.activate([HabitsViewController.collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     HabitsViewController.collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     HabitsViewController.collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     HabitsViewController.collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                                    ])
    }
    
    @objc func buttonTap() {
        self.navigationController?.pushViewController(habitVC, animated: false)
        habitVC.navigationItem.title = "Создать"
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
}

extension HabitsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HabitsStore.shared.habits.count + 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "habitProgress", for: indexPath) as? HabitProgressViewCell else { return UICollectionViewCell() }
            cell.initialProgress()
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "habitViewCell", for: indexPath) as? HabitCollectionViewCell else { return UICollectionViewCell() }
            cell.initialCell(habit: HabitsStore.shared.habits[indexPath.item - 1])
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: collectionView.frame.width - (16 * 2), height: 60)
        } else {
            return CGSize(width: collectionView.frame.width - (16 * 2), height: 130)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !(indexPath.item == 0) {
                  guard let item = collectionView.cellForItem(at: indexPath) as? HabitCollectionViewCell else { return }
                  
                  if let habit = item.habit {

                      navigationController?.pushViewController(HabitDetailsViewController(habit), animated: false)
                      navigationController?.navigationBar.prefersLargeTitles = false
                      //eventList!.events.sort(by: {$0.eventDate < $1.eventDate})


                  }
              }
    }
    
}


