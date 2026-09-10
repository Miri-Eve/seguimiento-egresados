package pe.gob.ministeriopublico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.gob.ministeriopublico.backend.entity.Usuario;

/** Acceso CRUD a los usuarios. */
@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> { }
