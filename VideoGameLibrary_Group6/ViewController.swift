//
//  ViewController.swift
//  VideoGameLibrary_Group6
//
//  Created by user211750 on 8/7/22.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableView.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    //drive number of cells in table view
    //an array of Games
    private var models = [Games]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Video Game Library"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //count number of rows in the Games model
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //current game at nth postion
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = model.title
        return cell
    }
    
    
    //core data
    func getAllItems(){
        //query out all of the db items
        do{
            //assign to models to return array of video game items
            let models = try context.fetch(Games.fetchRequest())
            //done on the main thread
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch{
           //error
        }
        
    }
    
    func addGame(title: String){
        let newItem = Games(context: context)
        newItem.title=title
        newItem.id = 0
        //newItem.company = company
        //newItem.genre = genre
        do{
            try context.save()
            
        }catch{
            
        }
    }
   
    func deleteGame(item: Games){
        context.delete(item)
        do{
            try context.save()
            
        }catch{
            
        }
        
    }
    
    func updateGames(item: Games, newTitle: String){
        item.title = newTitle
        do{
            try context.save()
            
        }catch{
            
        }
    }
    
}

