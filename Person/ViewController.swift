//
//  ViewController.swift
//  Person
//
//  Created by Christie Ferderer on 8/13/14.
//  Copyright (c) 2014 Christie Ferderer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var people = [Person]()
    var teacher = [Person]()
    var typeArr = ["Students", "Teachers"]
    var togetherArr = [[Person]]()
    var filePath: String?
    var fileName = "personList.plist"
 
    @IBOutlet weak var tableView: UITableView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.tableView.dataSource = self
            self.tableView.delegate = self
            
            self.people = self.createPeople()
            self.teacher = self.createTeacher()
            

            togetherArr = [people , teacher]
   
        //self.getPath("Monday")
    }
    
    func getPath (fileName: String) ->String {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = path[0] as String
        let secretFile = documentDirectory.stringByAppendingString(fileName)
        return secretFile
        //let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentsDirectory, .UserDomainMask, true)[0] as String
    }
    func checkFile (path: String)-> Bool{
         let manager = NSFileManager.defaultManager()
        if (manager.fileExistsAtPath(path)){
            return true
        }
        else{
            return false
        }
    }

func saveMyFile (objectSaver: AnyObject, fileName: String){
    if NSKeyedArchiver.archiveRootObject(objectSaver, toFile: fileName){
        println("made it")
        
    }
    else{
        println("failed")
    }
    
}

    
    func createPeople() -> [Person] {
        
        var christie = Person(firstName: "Christie", lastName: "Ferderer")
        var nate = Person (firstName: "Nate", lastName: "Birkholz")
        var matt = Person (firstName: "Matthew", lastName: "Brightbill")
        var jeff = Person(firstName: "Jeff", lastName: "Chavez")
        var david = Person(firstName: "David", lastName: "Fry")
        var adrian = Person (firstName: "Adrian", lastName: "Petrica Gherle")
        var jake = Person(firstName: "Jake", lastName: "Hawken")
        var tony = Person(firstName: "Tony", lastName: "Huang")
        var shams = Person(firstName: "Shams", lastName: "Kazi")
        var cameron = Person(firstName: "Cameron", lastName: "Klein")
        var kori = Person(firstName: "Kori", lastName: "Kolodziejczak")
        var parker = Person(firstName: "Parker", lastName: "Lewis")
        var nathan = Person (firstName: "Nathan", lastName: "Ma")
        var casey = Person (firstName: "Casey", lastName: "MacPhee")
        var brendan = Person(firstName: "Brendan", lastName: "McAleer")
        var brian = Person(firstName: "Brian", lastName: "Mendez")
        var mark = Person(firstName: "Mark", lastName: "Morris")
        var rowan = Person(firstName: "Rowan", lastName: "North")
        var lance = Person (firstName: "Lance", lastName: "Park")
        var kevin = Person(firstName: "Kevin", lastName: "Pham")
        var will = Person (firstName: "Will", lastName: "Richman")
        var Heather = Person(firstName: "Heather", lastName: "Theringer")
        var tuan = Person (firstName: "Tuan", lastName: "Vu")
        var zack = Person(firstName: "Zack ", lastName: "Walkingstick")
        var sarah = Person(firstName: "Sarah", lastName: "Wong")
        var hongyao = Person(firstName: "Hongyao", lastName: "Zhang")
       
         people = [christie, nate, matt, jeff, david, adrian, jake, tony, shams, cameron, kori, parker, nathan, casey, brendan, brian, mark, rowan, lance, kevin, will, Heather, tuan, zack, sarah, hongyao]
        
        
        return people
    }
    func createTeacher () ->[Person]{
        var brad = Person(firstName: "Brad", lastName: "Johnson")
        var john = Person(firstName: "John", lastName: "Clem")
        teacher = [brad, john]
       
        return teacher

    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return togetherArr[section].count
        
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = togetherArr[indexPath.section][indexPath.row].fullName()
        
        return cell
    }
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    

  func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
    return self.togetherArr.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) ->String{
        return typeArr[section]
    }
    
    func tableView(tableView: UITableView!, didDeselectRowAtIndexPath indexPath: NSIndexPath!){
    println(indexPath.item)
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    
        if segue.identifier == "ShowPerson"{
            var detailVC = segue.destinationViewController as detailViewController
            var selectedPeep = self.people[self.tableView.indexPathForSelectedRow().row]
            detailVC.selectedPerson = selectedPeep
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   


}

