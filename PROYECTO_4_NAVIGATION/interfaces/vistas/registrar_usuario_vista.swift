//
//  registrar_usuario_vista.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 04/03/26.
//
import SwiftUI

enum CamposRegistrarUsuario: String {
    case nombre = "nombre"
    case apodo = "apodo"
    case edad = "edad"
    case instagram = "instagram"
}

struct RegistrarUsuario: View {
    @Environment(ControladorGeneral.self) var controlador
    @Environment(\.dismiss) var salir
    
    @State var nombre: String = ""
    @State var instagram: String = ""
    @State var edad: String = ""
    @State var apodo: String = ""
    
    @State var error: ErrorUI? = nil

    
    var body: some View {
        if(error != nil){
            Text("Hay un problema, por favor resuelve")
        }
        
        VStack{
            // TextField("Nombre ", text: $nombre)
            CampoTexto(
                entrada: $nombre,
                placeholder: "Nombre",
                error: error,
                id: CamposRegistrarUsuario.nombre.rawValue
            )
        
            CampoTexto(
                entrada: $apodo,
                placeholder: "Apodo",
                error: error,
                id: CamposRegistrarUsuario.apodo.rawValue
            )
            
            TextField("Edad ", text: $edad)
            
            
            TextField("Instagram ", text: $instagram)
            
            Button(action: {
                validar_entradas()
            }){
                HStack{
                    Text("Agregar usuario")
                    Image(systemName: "person.fill.badge.plus")
                }
            }
        }
        .padding()
        
    }
    
    func validar_entradas(){
        if(nombre.isEmpty){
            error = ErrorUI(
                campo: CamposRegistrarUsuario.nombre.rawValue,
                error: "No tienes nombre, no seas webudo y ponte uno",
                nivel_de_error: .gravitsimo
            )
            
            return
        }
        
        if(apodo.isEmpty){
            error = ErrorUI(
                campo: CamposRegistrarUsuario.apodo.rawValue,
                error: "Apodo no valido, por favor selecciona otro",
                nivel_de_error: .gravitsimo
            )
            
            return
        }
        
        controlador.agregar_usuario(crear_usuario())
        salir() // Salir de la ventana
        apodo = ""
        nombre = ""
        edad = ""
        instagram = ""
    }
    
    func crear_usuario() -> Usuario{
        return Usuario(
            nombre: nombre,
            edad: Int(edad)!,
            apodo:apodo,
            instagram: instagram
        )
    }
    
}

#Preview {
    RegistrarUsuario()
        .environment(ControladorGeneral())
}
