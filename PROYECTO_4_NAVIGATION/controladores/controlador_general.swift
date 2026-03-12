//
//  controlador_general.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 02/03/26.
//
import SwiftUI

@Observable
class ControladorGeneral{
    public var mensajes: [Mensaje]
    public var usuarios: [Usuario]
    
    init() {
        mensajes = mensajes_falsos
        usuarios = usuarios_falsos
    }
    
    func agregar_mensajes() {
        mensajes += [Mensaje(texto: "mensaje de: \(mensajes.count + 1)", id_usuario: nil)]
    }
    
    func agregar_usuario( _ usuario_nuevo: Usuario){
        usuarios.append(usuario_nuevo)
        
        print("LA canitdad actual de usuarios es: \(usuarios.count)")
    }
}
