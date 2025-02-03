package com.es.mongocomp.service

import com.es.mongocomp.model.Noticia
import com.es.mongocomp.model.Usuario
import com.es.mongocomp.repository.UsuarioRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class UsuarioService {

    @Autowired
    lateinit var  usuarioRepository: UsuarioRepository

    fun inserirUsuario(usuario: Usuario):Usuario {
       return usuarioRepository.insert(usuario)
    }
}