package pe.gob.ministeriopublico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.gob.ministeriopublico.backend.entity.Modelo;

/** Acceso CRUD a los modelos. */
@Repository
public interface ModeloRepository extends JpaRepository<Modelo, Integer> { }
