package pe.gob.ministeriopublico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.gob.ministeriopublico.backend.entity.Despacho;

/** Acceso CRUD a los despachos. */
@Repository
public interface DespachoRepository extends JpaRepository<Despacho, Integer> { }
