//
//  LeaguesDetailsVC.swift
//  Sports
//
//  Created by Mohamed Adel on 1/28/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import UIKit

class LeaguesDetailsVC: UIViewController {
    
    var idLeague: String?

    //MARK:-Outlet section
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
      
    @IBOutlet weak var leastCollectionView: UICollectionView!
    
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        addingSwipe()

        // Do any additional setup after loading the view.
        print(idLeague!)
    }

    @IBAction func btnBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
extension LeaguesDetailsVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    //300 210
    func setupCollectionView(){
        
        //MARK:-upcomingCollectionView section
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //layout.itemSize = CGSize(width: 300, height: 210)
        upcomingCollectionView.collectionViewLayout = layout
        upcomingCollectionView.register(upcomingCollectionViewCell.nib(), forCellWithReuseIdentifier: "upcomingCollectionViewCell")
        upcomingCollectionView.delegate = self
        upcomingCollectionView.dataSource = self
        
        //MARK:-leastCollectionView section
        let secLayout = UICollectionViewFlowLayout()
        secLayout.scrollDirection = .vertical
        //secLayout.itemSize = CGSize(width: 330, height: 210)
        leastCollectionView.collectionViewLayout = secLayout
        leastCollectionView.register(lastestCollectionViewCell.nib(), forCellWithReuseIdentifier: "lastestCollectionViewCell")
        leastCollectionView.delegate = self
        leastCollectionView.dataSource = self
        //MARK:-TeamsCollectionView w= 184, h= 135
        
        let teamLayout = UICollectionViewFlowLayout()
        teamLayout.scrollDirection = .horizontal
        //secLayout.itemSize = CGSize(width: 330, height: 210)
        teamsCollectionView.collectionViewLayout = teamLayout
        teamsCollectionView.register(TeamsCollectionViewCell.nib(), forCellWithReuseIdentifier: "TeamsCollectionViewCell")
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if collectionView == upcomingCollectionView{
            let cell : upcomingCollectionViewCell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCollectionViewCell", for: indexPath) as! upcomingCollectionViewCell
            
            return cell
        }
        else if collectionView == teamsCollectionView{
            let cell : TeamsCollectionViewCell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as! TeamsCollectionViewCell
            
            return cell
        }
        else{
            let cell : lastestCollectionViewCell = leastCollectionView.dequeueReusableCell(withReuseIdentifier: "lastestCollectionViewCell", for: indexPath) as! lastestCollectionViewCell
            cell.frame.size.width = leastCollectionView.frame.width
            cell.frame.size.height = leastCollectionView.frame.height
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == upcomingCollectionView{
            return CGSize(width: 300, height: 210)
        }
        else if (collectionView == teamsCollectionView)
        {
            return CGSize(width:184, height: 135)
        }
        return CGSize(width:Int(leastCollectionView.frame.width), height: Int(leastCollectionView.frame.height))
        
    }
}

extension LeaguesDetailsVC {
    
    func addingSwipe()
    {
        let swipeRight = UISwipeGestureRecognizer(target: self, action:
             #selector(swipeFunc(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    @objc func swipeFunc(gesture : UISwipeGestureRecognizer)
    {
        dismiss(animated: true, completion: nil)
    }
    
}
