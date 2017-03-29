//
//  SchoolTableViewController.swift
//  truonghoc
//
//  Created by AgribankCard on 1/23/17.
//  Copyright © 2017 cuongpc. All rights reserved.
//

import UIKit
class SchoolTableViewController: UITableViewController {
    
    
    var students = [Student]()
    var classmodes = [ClassModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView?.isHidden = true
        navigationItem.leftBarButtonItem = editButtonItem
        loadSampleStudents()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return classmodes.count
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let nameClass = classmodes[section].name
        //find all student in this class
        var countStudentInClass = 0
        for student in students where student.className == nameClass {
            countStudentInClass += 1
        }
            return countStudentInClass
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classCell", for: indexPath)
        if (classmodes.count == 0) {
            
            
        }
        else {
            var studentInClass = [Student]()
            let classname = classmodes[indexPath.section].name
            for student in students where student.className == classname {
                studentInClass.append(student)
            }
            cell.textLabel?.text = studentInClass[indexPath.row].name
            
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (classmodes.count == 0) {
            return nil
        }
        else {
            return classmodes[section].name
        }
        
    }
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if ((classmodes.count) > 0) {
                //find class of student
                let classname = classmodes[indexPath.section].name
                var studentInClass = [Student]()
                for student in students where student.className == classname {
                    studentInClass.append(student)
                }
                //find name of student
                let nameStudent = studentInClass[indexPath.row].name
                students = students.filter(){$0.name != nameStudent }
                tableView.deleteRows(at: [indexPath], with: .fade)
                if studentInClass.count == 1 {
                    classmodes.remove(at: indexPath.section)
                    if classmodes.isEmpty {                    
                        tableView.tableFooterView?.isHidden = false
                    }
                }
                
            }
            tableView.reloadData()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func unwindFromAddingClass(sender : UIStoryboardSegue) {
        let sourceSender = sender.source as! AddingClassViewController
        let className = sourceSender.className
        //save as new class
        let newClass = ClassModel(name: className)
        classmodes.append(newClass!)
        tableView.reloadData()
    }
    private func loadSampleStudents() {
        
        
        let student1 = Student(name: "stuname 1", className: "lop1")
        let student2 = Student(name: "stuname 2", className: "lop1")
        let student3 = Student(name: "stuname 3", className: "lop2")
        let student4 = Student(name: "stuname 4", className: "lop2")
        
        let class1 = ClassModel(name: "lop1")
        let class2 = ClassModel(name: "lop2")
        
        classmodes = [class1!,class2!]
        students = [student1!, student2!, student3!, student4!]
        
    }
    
    
}
