//
//  IngredientesViewController.swift
//  CreaTuPizza
//
//  Created by lsalazar on 11/10/15.
//  Copyright © 2015 lsalazar. All rights reserved.
//

import UIKit

class IngredientesViewController: UIViewController {

    @IBOutlet weak var swtChampinion: UISwitch!
    @IBOutlet weak var swtAnchoa: UISwitch!
    @IBOutlet weak var swtPina: UISwitch!
    @IBOutlet weak var swtPimiento: UISwitch!
    @IBOutlet weak var swtSalchica: UISwitch!
    @IBOutlet weak var swtCebolla: UISwitch!
    @IBOutlet weak var swtAceituna: UISwitch!
    @IBOutlet weak var swtPepperoni: UISwitch!
    @IBOutlet weak var swtJamon: UISwitch!
    var tamanio : String = ""
    var tipoMasa : String = ""
    var tipoQueso : String = ""
    var ingredientes = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cambioIngrediente(sender: UISwitch) {
        switch(sender){
        case swtAceituna:
            agregarEliminarIngrediente("Aceituna", control: sender)
        case swtChampinion:
            agregarEliminarIngrediente("Champiñon", control: sender)
        case swtAnchoa:
            agregarEliminarIngrediente("Anchoa", control: sender)
        case swtPina:
            agregarEliminarIngrediente("Piña", control: sender)
        case swtPimiento:
            agregarEliminarIngrediente("Pimiento", control: sender)
        case swtSalchica:
            agregarEliminarIngrediente("Salchicha", control: sender)
        case swtCebolla:
            agregarEliminarIngrediente("Cebolla", control: sender)
        case swtPepperoni:
            agregarEliminarIngrediente("Pepperoni", control: sender)
        default:
            agregarEliminarIngrediente("Jamón", control: sender)
        }
    }
    
    func agregarEliminarIngrediente(ingrediente: String, control:UISwitch){
        let agregar = control.on
        if(agregar){
            if(ingredientes.count < 5){
                ingredientes.append(ingrediente)
            }
            else{
                //maximo 5 ingredientes
                let alert = UIAlertController(title: "Oops!", message:"Solo puedes seleccionar hasta 5 ingredientes.", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: .Default) { _ in })
                self.presentViewController(alert, animated: true){}
                control.setOn(false, animated: false)

            }
        }
        else{
            //eliminar el ingrediente
            let indexIngrediente : Int = ingredientes.indexOf(ingrediente)!
            ingredientes.removeAtIndex(indexIngrediente)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let siguienteVentana = segue.destinationViewController as! ResumenViewController
        siguienteVentana.tamanio = tamanio
        siguienteVentana.tipoMasa = tipoMasa
        siguienteVentana.tipoQueso = tipoQueso
        siguienteVentana.ingredientes = ingredientes
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if(ingredientes.count == 0){
            let alert = UIAlertController(title: "Oops!", message:"Es necesario que selecciones por lo menos un ingrediente", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .Default) { _ in })
            self.presentViewController(alert, animated: true){}
            return false
        }
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
