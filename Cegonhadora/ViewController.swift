//
//  ViewController.swift
//  Baby calculator
//
//  Created by Ana Carolina Soares de Melo on 02/03/20.
//  Copyright © 2020 Ana Melo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var scroll: UIScrollView!
    
    //PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        gender.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    
    //DatePicker
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Dismiss Keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        view.addGestureRecognizer(tap)
        
        //DatePicker
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(ViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        textFieldDia.inputView = datePicker
        
        //Scroll
        scroll.contentSize = CGSize(width: 414, height: 2000
        )
        
    }
    
    @objc func dateChanged (datePicker: UIDatePicker){
        let dateFormatterDay = DateFormatter()
        dateFormatterDay.dateFormat = "dd"
        textFieldDia.text = dateFormatterDay.string(from: datePicker.date)
        
        let dateFormatterMonth = DateFormatter()
        dateFormatterMonth.dateFormat = "MM"
        textFieldMes.text = dateFormatterMonth.string(from: datePicker.date)
        
        let dateFormatterYear = DateFormatter()
        dateFormatterYear.dateFormat = "yyyy"
        textFieldAno.text = dateFormatterYear.string(from: datePicker.date)
        
        view.endEditing(true)
        
    }
    
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }
    
    @IBOutlet var genderPicker: UIPickerView!
    
    @IBAction func clicarCalcular() {
        //checarEntrada()
        obterInformacoes()
        checarDataProvavel()
        aparecerResultado()
        desaparecerEntrada()
    }
    
    @IBAction func clicarRecalcular() {
        desaparecerResultado()
        limpar()
        aparecerEntrada()
    }
    
    @IBAction func clicarEntendi() {
        desaparecerMaisInformacoes()
    }
    
    @IBAction func clicarMaisInformacoes() {
        aparecerMaisInformacoes()
    }
    
    
    //@IBOutlet var viewCalendario: UIView!
    @IBOutlet var viewMaisInformacoes: UIView!
    @IBOutlet var textFieldHello: UILabel!
    @IBOutlet var textFieldInsertHere: UILabel!
    @IBOutlet var tituloDataProvavel: UILabel!
    @IBOutlet var fundoBrancoLabelDataProvavel: UIImageView!
    @IBOutlet var labelDataProvavel: UILabel!
    @IBOutlet var textFieldAno: UITextField!
    @IBOutlet var textFieldMes: UITextField!
    @IBOutlet var textFieldDia: UITextField!
    @IBOutlet var botaoInfo: UIButton!
    @IBOutlet var botaoRecalcular: UIButton!
    @IBOutlet var botaoCalcular: UIButton!
    @IBOutlet var Entendi: UIButton!
    @IBOutlet var semanasLabel: UILabel!
    @IBOutlet var segundaView: UIView!
    
    var informacaoData: Data = Data(dia: 0, mes: 0, ano: 0)
    var numeroDeSemanas: Int = 0
    
    //Arrays com memória interna
    let gender:[String] = ["Agênero", "Feminino", "Masculino"]
    
    // Funções
    func obterInformacoes(){
        
        // Ler os text fields
        let diaProvavel = textFieldDia.text!
        let mesProvavel = textFieldMes.text!
        let anoProvavel = textFieldAno.text!
        
        // Transformar string em inteiro
        let diaProvavelInt: Int = Int(diaProvavel) ?? 00
        let mesProvavelInt: Int = Int(mesProvavel) ?? 00
        let anoProvavelInt: Int = Int(anoProvavel) ?? 0000
        
        // Atribuicao
        informacaoData = Data(dia: diaProvavelInt, mes: mesProvavelInt, ano: anoProvavelInt)
        let infoData = informacaoData.calculoDataProvavel()
        labelDataProvavel.text = "\(infoData.day)/\(infoData.month)/\(infoData.year)"
        
        //        func calcularSemanas(){
        //            numeroDeSemanas = (informacaoData.mes - mesProvavelInt) * 4
        //            let semanasStrings: String = String( numeroDeSemanas)
        //            semanasLabel.text = semanasStrings
        //        }
    }
    
    func checarDataProvavel(){
        
        // Checar informacoes
        if informacaoData.dia < 1 {
            erroDeEntrada()
        } else if informacaoData.dia > 31 {
            erroDeEntrada()
            
        }
        
        if informacaoData.mes < 1 {
            erroDeEntrada()
        } else {
            if informacaoData.mes > 12 {
                erroDeEntrada()
                
            } else if informacaoData.mes == 02 && informacaoData.dia > 28{
                erroDeEntrada()
                
            }
        }
        
        if informacaoData.ano < 2018 {
            erroDeEntrada()
        } else if informacaoData.ano > 2020 {
            erroDeEntrada()
            
        }
    }
    
    func checarEntrada(){
        
        // Checar informacoes
        if textFieldDia.text == nil {
            erroDeEntrada()
        }
        
        if textFieldMes.text == nil {
            erroDeEntrada()
        }
        
        if textFieldAno.text == nil {
            erroDeEntrada()
        }
        
    }
    
    
    func desaparecerEntrada(){
        
        // Aparecer botão informação
        botaoInfo.isHidden = true
        
        // Aparecer textfields
        textFieldDia.isHidden = true
        textFieldMes.isHidden = true
        textFieldAno.isHidden = true
        
        // Aparecer labels "Insira aqui" e "Ola"
        textFieldHello.isHidden = true
        textFieldInsertHere.isHidden = true
        
        // Aparecer botao calcular
        botaoCalcular.isHidden = true
        
    }
    
    func limpar(){
        
        // Limpar text field
        self.textFieldDia.text = ""
        self.textFieldMes.text = ""
        self.textFieldAno.text = ""
        
    }
    
    func erroDeEntrada(){
        
        // Pop up de Erro
        let alert = UIAlertController(title: "Opa!", message: "Você não inseriu nenhuma informação.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Voltar", style: .default, handler: nil)
        
        alert.addAction(action)
        
        
        present(alert, animated: true, completion: nil)
    }
    
    func erroNil(){
        
        // Pop up de Erro
        let alert = UIAlertController(title: "Opa!", message: "Acho que você inseriu alguma informação equivocada.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Voltar", style: .default, handler: nil)
        
        alert.addAction(action)
        
        
        present(alert, animated: true, completion: nil)
    }
    
    func aparecerEntrada(){
        
        // Aparecer botão informação
        botaoInfo.isHidden = false
        
        // Aparecer textfields
        textFieldDia.isHidden = false
        textFieldMes.isHidden = false
        textFieldAno.isHidden = false
        
        // Aparecer labels "Insira aqui" e "Ola"
        textFieldHello.isHidden = false
        textFieldInsertHere.isHidden = false
        
        // Aparecer botao calcular
        botaoCalcular.isHidden = false
        
        
    }
    
    func aparecerResultado(){
        
        // Aparecer imagem de fundo paar label "data provavel"
        fundoBrancoLabelDataProvavel.isHidden = false
        
        segundaView.isHidden = false
        
        // Aparecer labels "A data provavel e" e "data provavel"
        labelDataProvavel.isHidden = false
        tituloDataProvavel.isHidden = false
        
        // Aparecer botao "recalcular"
        botaoRecalcular.isHidden = false
    }
    
    func desaparecerResultado(){
        
        // Desaparecer labels "A data provavel e" e "data provavel"
        labelDataProvavel.isHidden = true
        tituloDataProvavel.isHidden = true
        
        segundaView.isHidden = true
        
        // Desaparecer imagem de fundo paar label "data provavel"
        fundoBrancoLabelDataProvavel.isHidden = true
        
        // Desaparecer botao "recalcular"
        botaoRecalcular.isHidden = true
        
    }
    
    func aparecerMaisInformacoes(){
        // Aparecer pop up com mais informacoes
        viewMaisInformacoes.isHidden = false
    }
    
    func desaparecerMaisInformacoes(){
        viewMaisInformacoes.isHidden = true
    }
    
    
}
