//
//  usuario_modelo.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 09/03/26.
//
import Foundation

struct Usuario: Identifiable{
    let id = UUID()
    
    let nombre: String
    let edad: Int
    
    let apodo: String
    let instagram: String
    
    let conectado: Bool = false
}
