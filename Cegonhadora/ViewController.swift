//
//  ViewController.swift
//  Baby calculator
//
//  Created by Ana Carolina Soares de Melo on 02/03/20.
//  Copyright © 2020 Ana Melo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scroll: UIScrollView!
    
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
        scroll.contentSize = CGSize(width: 414, height: 1792
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
    
    @IBAction func clicarCalcular() {
        obterInformacoes()
        calcularTempo()
        aproximacoes()
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
        desaparecerMaisInfoDimensoes()
    }
    
    @IBAction func clicarMaisInformacoes() {
        aparecerMaisInformacoes()
    }
    
    @IBAction func clicarMaisInfoDimensoes() {
        aparecerMaisInfoDimensoes()
    }
    
    
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
    @IBOutlet var segundaView: UIView!
    @IBOutlet var labelComparaTamanho: UILabel!
    @IBOutlet var labelNumeroDeSemanas: UILabel!
    @IBOutlet var labelComprimento: UILabel!
    @IBOutlet var labelPeso: UILabel!
    @IBOutlet var viewMaisInfoDimensoes: UIView!
    @IBOutlet var botaoInfoDimensoes: UIButton!
    
    var informacaoData: Data = Data(dia: 0, mes: 0, ano: 0)
    var numeroDeSemanas: Int = 0
    
    // Funções
    func obterInformacoes() -> (dia: Int, mes: Int, ano: Int){
        
        // Ler os text fields
        let diaProvavel = textFieldDia.text!
        let mesProvavel = textFieldMes.text!
        let anoProvavel = textFieldAno.text!
        
        // Transformar string em inteiro
        let diaProvavelInt: Int = Int(diaProvavel) ?? 00
        let mesProvavelInt: Int = Int(mesProvavel) ?? 00
        let anoProvavelInt: Int = Int(anoProvavel) ?? 0000
        
       return (diaProvavelInt, mesProvavelInt, anoProvavelInt)
    }
    
    func calcularTempo(){
        //Data provável
        informacaoData = Data(dia: obterInformacoes().dia, mes: obterInformacoes().mes, ano: obterInformacoes().ano)
        let infoData = informacaoData.calculoDataProvavel()
        labelDataProvavel.text = "\(infoData.day)/\(infoData.month)/\(infoData.year)"
        
        //Semanas
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let first = dateFormatter.string(from: datePicker!.date)
        let firstDate = dateFormatter.date(from: first)!
        let last = "\(year)-\(month)-\(day)"
        let lastDate = dateFormatter.date(from: last)!

        let diffInDays = Calendar.current.dateComponents([.day], from: firstDate, to: lastDate).day
        
        numeroDeSemanas = diffInDays!/7
        labelNumeroDeSemanas.text = "\(diffInDays!/7) semanas e \(diffInDays!%7) dias"
    }
    
    func aproximacoes(){
        
        //Comparando com alimentos
        let aproximacaoComparada: Comparacoes = Comparacoes(quantidadeSemanas: numeroDeSemanas)
        let infoComparacao = aproximacaoComparada.comparacaoTamanho()
        labelComparaTamanho.text = "\(infoComparacao)"
        
        //Tamanho
        let tamanho: Dimensoes = Dimensoes(quantidadeSemanas: numeroDeSemanas)
        let infoTamanho = tamanho.calcularComprimento()
        labelComprimento.text = "\(infoTamanho)"
        
        //Peso
        let peso: Dimensoes = Dimensoes(quantidadeSemanas: numeroDeSemanas)
        let infoPeso = peso.calcularPeso()
        labelPeso.text = "\(infoPeso)"
    }
    
    func desaparecerEntrada(){
        
        // Desaparecer botão informação
        botaoInfo.isHidden = true
        
        // Desaparecer textfields
        textFieldDia.isHidden = true
        textFieldMes.isHidden = true
        textFieldAno.isHidden = true
        
        // Desaparecer labels "Insira aqui" e "Ola"
        textFieldHello.isHidden = true
        textFieldInsertHere.isHidden = true
        
        // Desaparecer botao calcular
        botaoCalcular.isHidden = true
    }
    
    func limpar(){
        
        // Limpar text field
        self.textFieldDia.text = ""
        self.textFieldMes.text = ""
        self.textFieldAno.text = ""
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
        
        // Aparecer labels "A data provavel e" e "data provavel"
        labelDataProvavel.isHidden = false
        tituloDataProvavel.isHidden = false
        segundaView.isHidden = false
        labelPeso.isHidden = false
        labelComprimento.isHidden = false
        labelComparaTamanho.isHidden = false
        labelNumeroDeSemanas.isHidden = false
        
        // Aparecer botao "recalcular"
        botaoRecalcular.isHidden = false
    }
    
    func desaparecerResultado(){
        
        // Desaparecer labels "A data provavel e" e "data provavel"
        labelDataProvavel.isHidden = true
        tituloDataProvavel.isHidden = true
        segundaView.isHidden = true
        labelPeso.isHidden = true
        labelComprimento.isHidden = true
        labelComparaTamanho.isHidden = true
        labelNumeroDeSemanas.isHidden = true
        
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
    
    func aparecerMaisInfoDimensoes(){
        // Aparecer pop up com mais informacoes
        viewMaisInfoDimensoes.isHidden = false
    }
    
    func desaparecerMaisInfoDimensoes(){
        viewMaisInfoDimensoes.isHidden = true
    }
}
