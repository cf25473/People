//
//  ViewController.swift
//  Person
//
//  Created by Christie Ferderer on 8/13/14.
//  Copyright (c) 2014 Christie Ferderer. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
                            

    
        
      
        // Do any additional setup after loading the view, typically from a nib.
    
    @IBOutlet weak var tableView: UITableView!
    var people = [Person]()
        override func viewDidLoad() {
            self.people = self.createPeople()
            //self.people = self.createTeacher()
            super.viewDidLoad()
            self.tableView.dataSource = self
      
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
        
    }
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        //cell.backgroundColor = UIColor.blueColor()
        var person = self.people[indexPath.row]
        cell.textLabel.text = person.fullName()
        return cell
    }
    
    func createPeople() -> [Person] {
        var people = [Person]()
        var teacher = [Person]()
        var brad = Person(firstName: "Brad", lastName: "Johnson")
        var christie = Person(firstName: "Christie", lastName: "Ferderer")
        var nate = Person (firstName: "Nate", lastName: "Birkholz")
        var matt = Person (firstName: "Matthew", lastName: "Brightbill")
        var jeff = Person(firstName: "Jeff", lastName: "Chavez")
        var john = Person(firstName: "John", lastName: "Clem")
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
        teacher.append(brad)
        people.append(christie)
        people.append(nate)
        people.append(matt)
        people.append(jeff)
        teacher.append(john)
        people.append(david)
        people.append(adrian)
        people.append(jake)
        people.append(tony)
        people.append(shams)
        people.append(cameron)
        people.append(kori)
        people.append(parker)
        people.append(nathan)
        people.append(casey)
        people.append(brendan)
        people.append(brian)
        people.append(mark)
        people.append(rowan)
        people.append(lance)
        people.append(kevin)
        people.append(will)
        people.append(Heather)
        people.append(tuan)
        people.append(zack)
        people.append(sarah)
        people.append(hongyao)
        
        return people
        // can only return one thing, anything after return doesnt print
 

    }
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
        func tableView(tableView: UITableView, titleForHeaderInSection: Int) ->String{
            return "Students"
        
  
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var detailVC = segue.destinationViewController as detailViewController
        var selectedPeep = self.people[self.tableView.indexPathForSelectedRow().row]
        detailVC.selectedPerson = selectedPeep
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   


}

