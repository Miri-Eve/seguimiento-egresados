package pe.gob.ministeriopublico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.gob.ministeriopublico.backend.entity.TipoPersonal;

/** Acceso CRUD a los tipos de personal. */
@Repository
public interface TipoPersonalRepository extends JpaRepository<TipoPersonal, Integer> { }
