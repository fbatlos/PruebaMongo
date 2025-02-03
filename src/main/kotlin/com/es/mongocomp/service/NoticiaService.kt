package com.es.mongocomp.service

import com.es.mongocomp.model.Noticia
import com.es.mongocomp.repository.NoticiaRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException
import org.springframework.stereotype.Service

@Service
class NoticiaService {

    @Autowired
    private lateinit var noticiaRepository: NoticiaRepository

    fun insertarNoticia(noticia: Noticia): Noticia{
        noticiaRepository.insert(noticia)
        return noticia
    }

    fun findAll() : List<Noticia>{
        return noticiaRepository.findAll()
    }

    fun update(noticia: Noticia, noticiaTitulo:String): Noticia?{

        val noticiabd = noticiaRepository.findByTitulo(noticiaTitulo) ?:throw NotFoundException()

        noticiabd.titulo = noticia.titulo
        noticiabd.cuerpo = noticia.cuerpo
        noticiabd.user = noticia.user

        noticiaRepository.save(noticiabd)

        return noticiabd

    }
}