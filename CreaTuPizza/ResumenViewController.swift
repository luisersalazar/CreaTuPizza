//
//  ResumenViewController.swift
//  CreaTuPizza
//
//  Created by lsalazar on 11/10/15.
//  Copyright © 2015 lsalazar. All rights reserved.
//

import UIKit

class ResumenViewController: UIViewController {

    @IBOutlet weak var lblTipoQueso: UILabel!
    @IBOutlet weak var lblTipoMasa: UILabel!
    @IBOutlet weak var lblTamanio: UILabel!
    @IBOutlet weak var lblIngredientes: UILabel!
    var tamanio : String = ""
    var tipoMasa : String = ""
    var tipoQueso : String = ""
    var ingredientes = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        lblIngredientes.text=""
        lblTamanio.text = tamanio
        lblTipoMasa.text = tipoMasa
        lblTipoQueso.text = tipoQueso
        for var i = 0; i < ingredientes.count; ++i{
            if(i == ingredientes.count-1)
            {lblIngredientes.text! += " \(ingredientes[i])"}
            else {lblIngredientes.text! += " \(ingredientes[i]),"}
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmar(sender: UIButton) {
        let alert = UIAlertController(title: "Orden exitosa!", message:"Tu piza ha sido creada correctamente, en unos minutos podras disfrutarla!", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .Default) { _ in })
        self.presentViewController(alert, animated: true){}
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
